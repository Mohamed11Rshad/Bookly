import 'package:bookly/core/errors/bookFailureWithCached.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase
    extends UseCase<BookFailureWithCached, List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<BookFailureWithCached, List<BookEntity>>> invoke(
      [int param = 0]) {
    return homeRepo.fetchFeaturedBooks(
      pageNumber: param,
    );
  }
}
