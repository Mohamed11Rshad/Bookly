import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_list_view_item.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/SearchIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<BookEntity> books = [];

    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchInitial) {
          books = [];
        }

        if (state is SearchSuccess) {
          if (state.pageNumber == 0) {
            books = [];
          }
          books.addAll(state.books);
        }

        if (state is SearchPaginationFailure || state is SearchFailure) {
          showSnackbar(
            context,
            msg: state is SearchPaginationFailure
                ? state.errMessage
                : (state as SearchFailure).errMessage,
          );
        }
      },
      builder: (context, state) {
        if (state is SearchSuccess ||
            state is SearchPaginationFailure ||
            state is SearchPaginationLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: BooksListViewItem(
                    bookEntity: books[index],
                  ),
                );
              },
              childCount: books.length,
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
          return const SearchIcon();
        }
      },
    );
  }
}
