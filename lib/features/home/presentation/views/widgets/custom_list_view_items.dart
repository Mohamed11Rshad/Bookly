import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/play_icon.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      alignment: Alignment.bottomRight,
      children: [
        BookImage(),
        PlayIcon(),
      ],
    );
  }
}
