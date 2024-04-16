import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

class BookImage extends StatelessWidget {
  final String image;
  const BookImage({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
