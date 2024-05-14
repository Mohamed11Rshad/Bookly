import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_cases/use_case_two_param.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class SimilarBooksUseCase
    extends UseCaseTwoParam<Failure, List<BookEntity>, String, int> {
  final HomeRepo homeRepo;
  SimilarBooksUseCase({
    required this.homeRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> invoke(String param, int param2) {
    return homeRepo.fetchSimilarBooks(
      category: param,
      pageNumber: param2,
    );
  }
}
