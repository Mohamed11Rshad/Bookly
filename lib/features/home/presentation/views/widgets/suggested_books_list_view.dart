import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class SuggestedBooksListView extends StatelessWidget {
  const SuggestedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.builder(
        padding: const EdgeInsets.only(left: 14),
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: (context, builder) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: BookImage(imageUrl: AssetsData.girlBookImage),
          );
        },
      ),
    );
  }
}
