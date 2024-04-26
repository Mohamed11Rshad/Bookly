import 'package:bookly/constants.dart';
import 'package:flutter/cupertino.dart';

abstract class Navigation {
  static Future<dynamic> navigateWithSlideAnimation(
      {required context, required Widget destination}) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionDuration: kTransitionDuration,
        reverseTransitionDuration: kTransitionDuration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  static Future<dynamic> navigateWithSlideAnimationRepalacement(
      {required context, required Widget destination}) {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => destination,
        transitionDuration: kTransitionDuration,
        reverseTransitionDuration: kTransitionDuration,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
