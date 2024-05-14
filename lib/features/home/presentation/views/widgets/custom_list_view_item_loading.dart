import 'package:flutter/material.dart';

class CustomListViewItemLoading extends StatelessWidget {
  const CustomListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: 1 / 1.5,
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
