import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/none_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestedBooksListView extends StatefulWidget {
  const SuggestedBooksListView({super.key, required this.category});
  final String? category;

  @override
  State<SuggestedBooksListView> createState() => _SuggestedBooksListViewState();
}

class _SuggestedBooksListViewState extends State<SuggestedBooksListView> {
  List<BookEntity> books = [];
  late ScrollController _scrollController;
  int nextPage = 1;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() async {
    if (_scrollController.position.extentAfter <
        0.7 * _scrollController.position.maxScrollExtent) {
      if (!isLoading) {
        isLoading = true;
        await BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
          category: widget.category,
          pageNumber: nextPage++,
        );
        isLoading = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SimilarBooksCubit, SimilarBooksState>(
      listener: (context, state) {
        if (state is SimilarBooksSuccess) {
          books.addAll(state.books);
        }

        if (state is SimilarBooksPaginationFailure) {
          showSnackbar(
            context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is SimilarBooksSuccess ||
            state is SimilarBooksPaginationLoading ||
            state is SimilarBooksPaginationFailure) {
          return SizedBox(
            height: 130,
            child: NotificationListener(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  return fetchSimilarBooks(context);
                }
                return false;
              },
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(left: 14),
                scrollDirection: Axis.horizontal,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: GestureDetector(
                      onTap: () {
                        Navigation.navigateWithSlideAnimationReplacement(
                          context: context,
                          destination: BookDetailsView(
                            book: books[index],
                          ),
                        );
                      },
                      child: BookImage(
                          errImageSize: 40, imageUrl: books[index].image ?? ''),
                    ),
                  );
                },
              ),
            ),
          );
        } else if (state is SimilarBooksLoading) {
          return CustomLoadingIndicator(
              width: MediaQuery.of(context).size.width, height: 150);
        } else {
          return const NoneWidget();
        }
      },
    );
  }

  bool fetchSimilarBooks(BuildContext context) {
    final double maxExtent = _scrollController.position.maxScrollExtent;
    final double currentOffset = _scrollController.position.pixels;

    if (currentOffset >= 0.9 * maxExtent && !isLoading) {
      isLoading = true;
      BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        pageNumber: nextPage,
        category: widget.category,
      );
      nextPage++;
    }

    return false;
  }
}
