import 'package:bookly/core/errors/bookFailureWithCached.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class BestSellerBooksUseCase
    extends UseCase<BookFailureWithCached, List<BookEntity>, int> {
  final HomeRepo homeRepo;

  BestSellerBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<BookFailureWithCached, List<BookEntity>>> invoke(
      [int param = 0]) {
    return homeRepo.fetchBestSellerBooks(
      pageNumber: param,
    );
  }
}
