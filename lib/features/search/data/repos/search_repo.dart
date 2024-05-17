import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<BookEntity>>> fetchSearchResultBooks({
    required String searchKey,
    int pageNumber = 0,
  });
}
