import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/similar_books_use_case.dart';
import 'package:bookly/features/home/presentation/manager/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SimilarBooksCubit(
        SimilarBooksUseCase(
          homeRepo: getIt.get<HomeRepoImpl>(),
        ),
      ),
      child: Scaffold(
        body: BookDetailsViewBody(book: book),
      ),
    );
  }
}
