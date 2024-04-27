import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key, required this.state});
  final SearchState state;

  @override
  Widget build(BuildContext context) {
    if (state is SearchSuccess) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: BooksListViewItem(
                bookModel: (state as SearchSuccess).books[index],
              ),
            );
          },
          childCount: (state as SearchSuccess).books.length,
        ),
      );
    } else if (state is SearchLoading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: CustomLoadingIndicator(
            width: 100,
            height: 100,
          ),
        ),
      );
    } else {
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
}
