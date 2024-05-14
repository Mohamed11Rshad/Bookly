import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item_loading.dart';
import 'package:flutter/material.dart';

class BestSellerListViewSliverLoading extends StatelessWidget {
  const BestSellerListViewSliverLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: BooksListViewItemLoading(),
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}
