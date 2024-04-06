import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlayIcon extends StatelessWidget {
  const PlayIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final circleSize = screenHeight * 0.054;
    return Padding(
      padding: EdgeInsets.all(screenHeight * 0.012),
      child: Container(
        height: circleSize,
        width: circleSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2000),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2000),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.transparent, // Adjust opacity as needed
              child: Padding(
                padding: EdgeInsets.only(left: screenHeight * 0.002),
                child: Icon(
                  FontAwesomeIcons.play,
                  size: screenHeight * 0.012,
                  color: Colors.white, // Change icon color as needed
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
