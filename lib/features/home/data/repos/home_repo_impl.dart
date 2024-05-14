import 'package:bookly/core/errors/bookFailureWithCached.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/features/home/data/data_sources/home_remote_data_sorce.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl(
      {required this.homeRemoteDataSource,
      required this.homeLocalDataSource,
      e});
  @override
  Future<Either<BookFailureWithCached, List<BookEntity>>> fetchBestSellerBooks({
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.fetchBestSellerBooks(
        pageNumber: pageNumber,
      );

      return right(books);
    } catch (e) {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchBestSellerBooks(
        pageNumber: pageNumber,
      );
      if (e is DioException) {
        return left(
          BookFailureWithCached(
            failure: ServerFailure.fromDioException(e),
            cachedBooks: cachedBooks,
          ),
        );
      }
      return left(
        BookFailureWithCached(
          failure: ServerFailure(errMessage: e.toString()),
          cachedBooks: cachedBooks,
        ),
      );
    }
  }

  @override
  Future<Either<BookFailureWithCached, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0}) async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );

      return right(books);
    } catch (e) {
      List<BookEntity> cachedBooks = homeLocalDataSource.fetchFeaturedBooks(
        pageNumber: pageNumber,
      );
      if (e is DioException) {
        return left(
          BookFailureWithCached(
            failure: ServerFailure.fromDioException(e),
            cachedBooks: cachedBooks,
          ),
        );
      }
      return left(
        BookFailureWithCached(
          failure: ServerFailure(errMessage: e.toString()),
          cachedBooks: cachedBooks,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    try {
      List<BookEntity> books = await homeRemoteDataSource.fetchSimilarBooks(
        category: category,
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
