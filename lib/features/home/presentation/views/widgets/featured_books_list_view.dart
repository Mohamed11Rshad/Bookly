import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_list_view_item.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({super.key});

  @override
  FeaturedBooksListViewState createState() => FeaturedBooksListViewState();
}

class FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  int _currentIndex = 0;
  int nextPage = 1;
  List<BookEntity> books = [];

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQuerywidth = MediaQuery.of(context).size.width;

    return BlocConsumer<FeaturedBooksCubit, FeaturedBooksState>(
      listener: (context, state) {
        if (state is FeaturedBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FeaturedBooksFailure) {
          books = state.cachedBooks;
        }
        if (state is FeaturedBooksPaginationFailure) {
          showSnackbar(
            context,
            msg: state.errMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is FeaturedBooksSuccess ||
            state is FeaturedBooksPaginationLoading ||
            state is FeaturedBooksPaginationFailure ||
            state is FeaturedBooksFailure) {
          return SizedBox(
            width: mediaQuerywidth,
            height: mediaQueryHeight * 0.31,
            child: CarouselSlider.builder(
              itemCount: books.length,
              options: CarouselOptions(
                viewportFraction: 0.4,
                padEnds: false,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                      if (index >= books.length * 0.7) {
                        BlocProvider.of<FeaturedBooksCubit>(context)
                            .fetchFeaturedBooks(
                          pageNumber: nextPage++,
                        );
                      }
                    },
                  );
                },
              ),
              itemBuilder: (BuildContext context, int index, int realIndex) {
                // Determine the scale based on the position of the item
                final double scale = index == _currentIndex ? 1.13 : 1;

                return Transform.scale(
                  scale: scale,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CustomListViewItem(
                      book: books[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return FeaturedBooksListLoadingIndicator(
            width: mediaQuerywidth,
            height: mediaQueryHeight,
          );
        }
      },
    );
  }
}
