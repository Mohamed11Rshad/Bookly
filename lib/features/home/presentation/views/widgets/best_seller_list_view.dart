import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view_loading.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListViewSliver extends StatefulWidget {
  const BestSellerListViewSliver({super.key});

  @override
  State<BestSellerListViewSliver> createState() =>
      _BestSellerListViewSliverState();
}

class _BestSellerListViewSliverState extends State<BestSellerListViewSliver> {
  List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerBooksCubit, BestSellerBooksState>(
      listener: (context, state) {
        if (state is BestSellerBooksSuccess) {
          
          books.addAll(state.books);
        }
        if (state is BestSellerBooksFailure) {
          books = state.cachedBooks;
        }
        if (state is BestSellerBooksPaginationFailure) {
          showSnackbar(
            context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is BestSellerBooksSuccess ||
            state is BestSellerBooksPaginationLoading ||
            state is BestSellerBooksPaginationFailure ||
            state is BestSellerBooksFailure) {
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
                      bookEntity: books[index],
                    ),
                  ),
                );
              },
              childCount: books.length,
            ),
          );
        } else {
          return const BestSellerListViewSliverLoading();
        }
      },
    );
  }
}
