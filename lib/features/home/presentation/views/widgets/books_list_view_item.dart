import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BooksListViewItem extends StatelessWidget {
  final BookEntity bookEntity;
  const BooksListViewItem({super.key, required this.bookEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.navigateWithSlideAnimation(
          context: context,
          destination: BookDetailsView(
            book: bookEntity,
          ),
        );
      },
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            BookImage(
              imageUrl: bookEntity.image ?? '',
              errImageSize: 40,
            ),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Text(
                      bookEntity.title!,
                      style: Styles.textStyle22.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    bookEntity.authorName == null
                        ? 'Unknown'
                        : bookEntity.authorName!,
                    style: Styles.textStyle14.copyWith(color: Colors.white60),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${(bookEntity.price) ?? 'free'}',
                        style: Styles.numTextStyle20,
                      ),
                      Text(
                        (bookEntity.price) == null ? '' : ' €',
                        style: Styles.numTextStyle18,
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookEntity.rating ?? 0,
                        count: bookEntity.ratingCount ?? 0,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
