import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_box_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomBookDetailsAppBar(),
        BookDetailsSection(),
        Expanded(
          child: SizedBox(
            height: 30,
          ),
        ),
        SuggestedBooksSection(),
      ],
    );
  }
}
