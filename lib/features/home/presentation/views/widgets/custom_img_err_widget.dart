import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomImageErrWidget extends StatelessWidget {
  final double size;
  const CustomImageErrWidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Icon(
        FontAwesomeIcons.image,
        size: size,
      ),
    );
  }
}
