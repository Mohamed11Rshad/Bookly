import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomAuthorNameWidget extends StatelessWidget {
  final String authorName;
  const CustomAuthorNameWidget({
    super.key,
    required this.deviceWidth,
    required this.authorName,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth * 0.7,
      child: Text(
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        authorName,
        style: Styles.textStyle18.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
          color: Colors.white70,
        ),
      ),
    );
  }
}
