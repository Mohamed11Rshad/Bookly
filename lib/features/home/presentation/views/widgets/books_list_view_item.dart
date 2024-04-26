import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/navigation.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BooksListViewItem extends StatelessWidget {
  final BookModel bookModel;
  const BooksListViewItem({super.key, required this.bookModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigation.navigateWithSlideAnimation(
          context: context,
          destination: BookDetailsView(
            book: bookModel,
          ),
        );
      },
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            BookImage(
              imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
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
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo.title!,
                      style: Styles.textStyle22.copyWith(
                        fontFamily: kGtSectraFine,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    bookModel.volumeInfo.authors == null
                        ? 'Unknown'
                        : bookModel.volumeInfo.authors![0],
                    style: Styles.textStyle14.copyWith(color: Colors.white60),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        '${(bookModel.saleInfo?.retailPrice?.amount) ?? 'free'}',
                        style: Styles.numTextStyle20,
                      ),
                      Text(
                        (bookModel.saleInfo?.retailPrice?.amount) == null
                            ? ''
                            : ' €',
                        style: Styles.numTextStyle18,
                      ),
                      const Spacer(),
                      BookRating(
                        rating: bookModel.volumeInfo.averageRating ?? 0,
                        count: bookModel.volumeInfo.ratingCount ?? 0,
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
