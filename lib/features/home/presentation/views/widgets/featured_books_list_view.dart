import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'custom_list_view_items.dart';

class FeaturedBooksListView extends StatefulWidget {
  const FeaturedBooksListView({Key? key}) : super(key: key);

  @override
  _FeaturedBooksListViewState createState() => _FeaturedBooksListViewState();
}

class _FeaturedBooksListViewState extends State<FeaturedBooksListView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var mediaQueryHeight = MediaQuery.of(context).size.height;
    var mediaQuerywidth = MediaQuery.of(context).size.width;

    List movies = [
      AssetsData.harryMovieImage,
      AssetsData.girlMovieImage,
      AssetsData.lucaMovieImage,
      AssetsData.incredMovieImage,
    ];
    return SizedBox(
      width: mediaQuerywidth,
      height: mediaQueryHeight * 0.31,
      child: CarouselSlider.builder(
        itemCount: movies.length,
        options: CarouselOptions(
          viewportFraction: 0.38,
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
                image: movies[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
