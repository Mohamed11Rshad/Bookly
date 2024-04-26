import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_loading_indicator.dart';
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

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQuerywidth = MediaQuery.of(context).size.width;

    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            width: mediaQuerywidth,
            height: mediaQueryHeight * 0.31,
            child: CarouselSlider.builder(
              itemCount: state.books.length,
              options: CarouselOptions(
                viewportFraction: 0.4,
                padEnds: false,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
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
                      book: state.books[index],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator(
            width: mediaQuerywidth,
            height: mediaQueryHeight * 0.31,
          );
        }
      },
    );
  }
}
