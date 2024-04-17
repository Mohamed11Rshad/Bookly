import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_books_list_view.dart';
import 'package:flutter/material.dart';

class SuggestedBooksSection extends StatelessWidget {
  const SuggestedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            bottom: 16,
          ),
          child: Text(
            'You can also like',
            style: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SuggestedBooksListView(),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
