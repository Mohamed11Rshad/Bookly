import 'package:flutter/material.dart';

class FadedLogo extends StatelessWidget {
  const FadedLogo({
    super.key,
    required this.opacityAnimation,
  });

  final Animation<double> opacityAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: opacityAnimation,
        builder: (context, _) {
          return FadeTransition(
            opacity: opacityAnimation,
            child: const Text(
              'Open a Book, Open Your Mind',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        });
  }
}
