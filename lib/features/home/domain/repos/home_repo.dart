import 'package:bookly/core/errors/bookFailureWithCached.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<BookFailureWithCached, List<BookEntity>>> fetchBestSellerBooks({
    int pageNumber = 0,
  });
  Future<Either<BookFailureWithCached, List<BookEntity>>> fetchFeaturedBooks(
      {int pageNumber = 0});
  Future<Either<Failure, List<BookEntity>>> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  });
  
}
