import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_title.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_author_name_widget.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.26),
          child: BookImage(
            imageUrl: book.image ?? '',
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        BookTitle(
          deviceWidth: deviceWidth,
          bookTitle: book.title ?? 'Unknown',
        ),
        CustomAuthorNameWidget(
          deviceWidth: deviceWidth,
          authorName: book.authorName ?? 'Unknown',
        ),
        const SizedBox(
          height: 10,
        ),
        BookRating(
          rating: book.rating ?? 0,
          count: book.ratingCount ?? 0,
        ),
        const SizedBox(
          height: 24,
        ),
        BooksActionsButton(
          url: book.previewLink,
          price: book.price ?? 0,
        ),
      ],
    );
  }
}
