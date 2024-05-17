import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  final BookEntity book;
  const CustomListViewItem({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.navigateWithSlideAnimation(
          context: context,
          destination: BookDetailsView(
            book: book,
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 24),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            BookImage(
              imageUrl: book.image ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
