import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_list_view_item_loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';

class FeaturedBooksListLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListLoadingIndicator(
      {super.key, required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        width: width,
        height: height * 0.31,
        child: CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
            viewportFraction: 0.4,
            padEnds: false,
            enableInfiniteScroll: false,
          ),
          itemBuilder: (BuildContext context, int index, int realIndex) {
            return const Align(
              alignment: Alignment.topCenter,
              child: CustomListViewItemLoading(),
            );
          },
        ),
      ),
    );
  }
}
