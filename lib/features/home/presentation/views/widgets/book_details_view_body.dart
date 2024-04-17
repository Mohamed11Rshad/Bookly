import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: deviceWidth * 0.47,
          child: const BookImage(image: AssetsData.lucaBookImage),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: deviceWidth * 0.7,
          child: Text(
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            "Disney Luca Book",
            style: Styles.textStyle30.copyWith(
              fontFamily: kGtSectraFine,
            ),
          ),
        ),
        SizedBox(
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
        )
      ],
    );
  }
}
