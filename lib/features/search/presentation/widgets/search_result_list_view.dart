import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:flutter/cupertino.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: BooksListViewItem(),
          );
        },
        childCount: 20,
      ),
    );
  }
}
