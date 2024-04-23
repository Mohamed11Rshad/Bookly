import 'package:bookly/core/widgets/custom_title.dart';
import 'package:bookly/features/home/presentation/manager/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is! FeaturedBooksFailure) {
          return const CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
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
              BestSellerListViewSliver(),
            ],
          );
        } else {
          return Center(
            child: CustomErrorWidget(
              errMessage: state.errMessage,
            ),
          );
        }
      },
    );
  }
}
