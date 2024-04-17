import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

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
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 4),
          child: Text(
            '4.8',
            style: Styles.textStyle14,
          ),
        ),
        Text(
          '(2390)',
          style: Styles.textStyle14.copyWith(color: Colors.white54),
        ),
      ],
    );
  }
}
