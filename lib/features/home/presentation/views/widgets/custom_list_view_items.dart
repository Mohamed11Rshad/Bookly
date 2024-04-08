import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/play_icon.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.05),
      child: const Stack(
        alignment: Alignment.bottomRight,
        children: [
          BookImage(),
          PlayIcon(),
        ],
      ),
    );
  }
}
