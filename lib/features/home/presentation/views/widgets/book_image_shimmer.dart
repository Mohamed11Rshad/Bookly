import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookImageShimmer extends StatelessWidget {
  const BookImageShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white24,
      highlightColor: Colors.white38,
      child: Container(
        color: Colors.white, // You can adjust the color as per your UI theme
      ),
    );
  }
}
