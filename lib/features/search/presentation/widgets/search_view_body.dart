import 'package:bookly/core/widgets/custom_title.dart';
import 'package:bookly/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 25,
                ),
                CustomSearchTextField(),
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6, bottom: 20),
                  child: CustomTitle(title: 'Search Result'),
                )
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: 24,
          ),
          sliver: SearchResultListView(),
        ),
      ],
    );
  }
}
