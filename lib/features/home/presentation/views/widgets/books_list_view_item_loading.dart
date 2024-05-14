import 'package:bookly/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

class BooksListViewItemLoading extends StatelessWidget {
  const BooksListViewItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: AspectRatio(
                aspectRatio: 1 / 1.5,
                child: Container(
                  color: Colors.white,
                ),
              ),
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
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: AspectRatio(
                        aspectRatio: 5.5 / 0.5,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: AspectRatio(
                        aspectRatio: 5 / 0.5,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 220,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: AspectRatio(
                        aspectRatio: 5.5 / 0.5,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        width: 10,
                        color: Colors.white,
                      ),
                      Container(
                        width: 10,
                        color: Colors.white,
                      ),
                      const Spacer(),
                      Container(
                        width: 10,
                        color: Colors.white,
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
