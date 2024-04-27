import 'package:bookly/features/home/presentation/manager/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewSliver extends StatelessWidget {
  const BestSellerListViewSliver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerBooksCubit, BestSellerBooksState>(
      builder: (context, state) {
        if (state is BestSellerBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: BooksListViewItem(
                      bookModel: state.books[index],
                    ),
                  ),
                );
              },
              childCount: state.books.length,
            ),
          );
        } else if (state is BestSellerBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(
              errMessage: state.errMessage,
              onRefresh: () async {
                await BlocProvider.of<BestSellerBooksCubit>(context)
                    .fetchBestSellerBooks();
              },
            ),
          );
        } else {
          return const SliverToBoxAdapter(
            child: SizedBox(
              height: 300,
              child: CustomLoadingIndicator(
                width: 20,
                height: 40,
              ),
            ),
          );
        }
      },
    );
  }
}
