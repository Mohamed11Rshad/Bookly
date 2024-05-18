import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_title.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/views/widgets/SearchIcon.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  int nextPage = 1;
  bool isLoading = false;
  bool isListOfBooksEmpty = true;
  String key = " ";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchState>(
      listener: (context, state) {
        if (state is SearchSuccess) {
          key = state.key;
          isLoading = false;
          isListOfBooksEmpty = !state.books.isNotEmpty;
        }

        if (state is SearchPaginationLoading) {
          isLoading = true;
        }

        if (state is SearchInitial) {
          isListOfBooksEmpty = true;
        }
      },
      builder: (context, state) {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            return !isListOfBooksEmpty
                ? fetchSearchResult(scrollNotification, context)
                : false;
          },
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      const CustomSearchTextField(),
                      (state is SearchSuccess)
                          ? const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                                bottom: 20,
                                top: 25,
                              ),
                              child: CustomTitle(title: 'Search Result'),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                sliver: SearchResultListView(),
              ),
              SliverToBoxAdapter(
                child: (isLoading)
                    ? const CustomLoadingIndicator(
                        width: 50,
                        height: 50,
                      )
                    : const SizedBox(),
              )
            ],
          ),
        );
      },
    );
  }

  bool fetchSearchResult(
      ScrollNotification scrollNotification, BuildContext context) {
    if (scrollNotification.metrics.pixels >=
            0.9 * scrollNotification.metrics.maxScrollExtent &&
        isLoading == false) {
      BlocProvider.of<SearchCubit>(context).fetchSearchResultBooks(
        searchKey: key,
        pageNumber: nextPage++,
      );
    }
    return false;
  }
}
