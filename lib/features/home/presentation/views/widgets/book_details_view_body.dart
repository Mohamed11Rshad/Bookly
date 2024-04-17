import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_actions_button.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_books_list_view.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.25),
          child: const BookImage(image: AssetsData.lucaBookImage),
        ),
        const SizedBox(
          height: 20,
        ),
        BookTitle(deviceWidth: deviceWidth),
        AuthorName(deviceWidth: deviceWidth),
        const SizedBox(
          height: 10,
        ),
        const BookRating(),
        const SizedBox(
          height: 24,
        ),
        const BooksActionsButton(),
        const Expanded(
          child: SizedBox(
            height: 30,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            bottom: 16,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'You can also like',
              style: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SuggestedBooksListView(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class AuthorName extends StatelessWidget {
  const AuthorName({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: deviceWidth * 0.7,
      child: Text(
        textAlign: TextAlign.center,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        "Rudyard Kipling",
        style: Styles.textStyle18.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.normal,
          color: Colors.white70,
        ),
      ),
    );
  }
}

class BookTitle extends StatelessWidget {
  const BookTitle({
    super.key,
    required this.deviceWidth,
  });

  final double deviceWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Text(
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        "Luca",
        style: Styles.textStyle30.copyWith(
          fontFamily: kGtSectraFine,
        ),
      ),
    );
  }
}
