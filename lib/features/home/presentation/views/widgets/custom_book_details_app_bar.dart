import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
        top: 54,
        bottom: 18,
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.close,
              size: 28,
            ),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            padding: const EdgeInsets.all(12),
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 24,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
