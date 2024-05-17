import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/search/data/data_sources/search_remote_data_source.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  SearchRepoImpl({required this.searchRemoteDataSource});

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSearchResultBooks({
    required String searchKey,
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books =
          await searchRemoteDataSource.fetchSearchResultBooks(
        searchKey: searchKey,
        pageNumber: pageNumber,
      );

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      }
      return left(
        ServerFailure(
          errMessage: e.toString(),
        ),
      );
    }
  }
}
