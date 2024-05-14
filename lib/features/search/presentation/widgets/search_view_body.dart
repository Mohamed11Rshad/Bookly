import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_title.dart';
import 'package:bookly/features/search/presentation/manager/search_cubit/search_cubit.dart';
import 'package:bookly/features/search/presentation/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return CustomScrollView(
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
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                sliver: SearchResultListView(state: state),
              ),
            ],
          );
        }
      },
    );
  }
}
