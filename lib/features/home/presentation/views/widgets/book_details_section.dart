import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_title.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_author_name_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.26),
          child: BookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BookTitle(
          deviceWidth: deviceWidth,
          bookTitle: book.volumeInfo.title ?? 'Unknown',
        ),
        CustomAuthorNameWidget(
          deviceWidth: deviceWidth,
          authorName: book.volumeInfo.authors?[0] ?? 'Unknown',
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingCount ?? 0,
        ),
        const SizedBox(
          height: 24,
        ),
        BooksActionsButton(
          url: book.volumeInfo.previewLink,
          price: book.saleInfo?.listPrice?.amount ?? 0,
        ),
      ],
    );
  }
}
