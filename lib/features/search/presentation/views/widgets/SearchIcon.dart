import 'package:flutter/material.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Icon(
          Icons.search,
          size: 300,
          color: Colors.white24,
        ),
      ),
    );
  }
}
