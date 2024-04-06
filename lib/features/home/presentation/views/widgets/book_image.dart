import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';

class BookImage extends StatelessWidget {
  const BookImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.3,
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsData.testImage,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
