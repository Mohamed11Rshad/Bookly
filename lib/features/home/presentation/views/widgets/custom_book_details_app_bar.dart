import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBookDetailsAppBar extends StatelessWidget {
  const CustomBookDetailsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
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
            padding: const EdgeInsets.only(
              right: 15,
              left: 10,
              top: 10,
              bottom: 10,
            ),
            icon: const Icon(
              FontAwesomeIcons.cartShopping,
              size: 22,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
