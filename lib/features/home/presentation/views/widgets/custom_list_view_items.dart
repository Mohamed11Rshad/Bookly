import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/play_icon.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  final String image;
  const CustomListViewItem({super.key, required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          BookImage(
            image: image,
          ),
          const PlayIcon(),
        ],
      ),
    );
  }
}
