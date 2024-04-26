import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/play_icon.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  final BookModel book;
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
              imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
