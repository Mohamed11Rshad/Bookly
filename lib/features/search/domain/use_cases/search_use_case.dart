import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/use_cases/use_case_two_param.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase
    extends UseCaseTwoParam<Failure, List<BookEntity>, String, int> {
  final SearchRepo searchRepo;
  SearchUseCase({
    required this.searchRepo,
  });

  @override
  Future<Either<Failure, List<BookEntity>>> invoke(String param, int param2) {
    return searchRepo.fetchSearchResultBooks(
      searchKey: param,
      pageNumber: param2,
    );
  }
}
