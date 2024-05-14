import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/core/widgets/custom_title.dart';
import 'package:bookly/features/home/presentation/manager/best_seller_cubit/best_seller_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  int nextPage = 1;
  bool isLoading = false;
  bool isCachedState = false;
  bool showErrorWidget = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BestSellerBooksCubit, BestSellerBooksState>(
      listener: (context, state) {
        if (state is BestSellerBooksSuccess) {
          if (state.books.isNotEmpty) {
            showErrorWidget = false;
          }
          isLoading = false;
        }

        if (state is BestSellerBooksFailure) {
          isCachedState = true;
          if (state.cachedBooks.isEmpty) {
            showErrorWidget = true;
          }
          showSnackbar(
            context,
            msg: state.errMessage,
          );
        }

        if (state is BestSellerBooksPaginationLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return showErrorWidget
            ? const CustomErrorWidget(
                errMessage: "Failed to load data",
              )
            : NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  return !isCachedState
                      ? fetchBestSeller(scrollNotification, context)
                      : false;
                },
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomHomeAppBar(),
                          FeaturedBooksListView(),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 24,
                              bottom: 15,
                            ),
                            child: CustomTitle(title: 'Best Seller'),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const BestSellerListViewSliver(),
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

  bool fetchBestSeller(
      ScrollNotification scrollNotification, BuildContext context) {
    if (scrollNotification.metrics.pixels >=
            0.9 * scrollNotification.metrics.maxScrollExtent &&
        isLoading == false) {
      BlocProvider.of<BestSellerBooksCubit>(context).fetchBestSellerBooks(
        pageNumber: nextPage++,
      );
    }
    return false;
  }
}
