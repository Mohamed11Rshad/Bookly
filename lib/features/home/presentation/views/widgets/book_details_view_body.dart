import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_details_app_bar.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/suggested_box_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsViewBody extends StatefulWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final BookEntity book;

  @override
  State<BookDetailsViewBody> createState() => _BookDetailsViewBodyState();
}

class _BookDetailsViewBodyState extends State<BookDetailsViewBody> {
  @override
  void initState() {
    super.initState();
    String? category;
    if (widget.book.category == null) {
      category = widget.book.title;
    } else {
      category = widget.book.category;
    }

    BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
      category: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is! SimilarBooksFailure) {
          return ListView(
            children: [
              const CustomBookDetailsAppBar(),
              BookDetailsSection(book: widget.book),
              const Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SuggestedBooksSection(
                category: widget.book.category ?? widget.book.title,
              ),
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
