import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

class BookTitle extends StatelessWidget {
  final String bookTitle;
  const BookTitle({
    super.key,
    required this.deviceWidth,
    required this.bookTitle,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        bookTitle,
        style: Styles.textStyle24.copyWith(
          fontFamily: kGtSectraFine,
        ),
      ),
    );
  }
}
