import 'package:bookly/features/home/presentation/views/widgets/book_image_shimmer.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_img_err_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImage extends StatelessWidget {
  final String imageUrl;
  final double? errImageSize;
  const BookImage({
    super.key,
    required this.imageUrl,
    this.errImageSize,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const BookImageShimmer(),
          fit: BoxFit.fill,
          errorWidget: (context, url, error) => CustomImageErrWidget(
            size: errImageSize ?? 80,
          ),
        ),
      ),
    );
  }
}
