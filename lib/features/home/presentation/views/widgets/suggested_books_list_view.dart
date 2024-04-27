import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/none_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SuggestedBooksListView extends StatelessWidget {
  const SuggestedBooksListView({super.key, required this.state});
  final SimilarBooksState state;

  @override
  Widget build(BuildContext context) {
    if (state is SimilarBooksSuccess) {
      return SizedBox(
        height: 130,
        child: ListView.builder(
          padding: const EdgeInsets.only(left: 14),
          scrollDirection: Axis.horizontal,
          itemCount: (state as SimilarBooksSuccess).books.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  Navigation.navigateWithSlideAnimationRepalacement(
                    context: context,
                    destination: BookDetailsView(
                      book: (state as SimilarBooksSuccess).books[index],
                    ),
                  );
                },
                child: BookImage(
                    imageUrl: (state as SimilarBooksSuccess)
                            .books[index]
                            .volumeInfo
                            .imageLinks
                            ?.thumbnail ??
                        ''),
              ),
            );
          },
        ),
      );
    } else if (state is SimilarBooksLoading) {
      return CustomLoadingIndicator(
          width: MediaQuery.of(context).size.width, height: 150);
    } else {
      return const NoneWidget();
    }
  }
}
