import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  final num rating;
  final int count;
  const BookRating({
    super.key,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 4),
          child: Text(
            "$rating",
            style: Styles.textStyle16,
          ),
        ),
        Text(
          " ($count)",
          style: Styles.textStyle14.copyWith(color: Colors.white54),
        ),
      ],
    );
  }
}
