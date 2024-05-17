import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/entities/book_entity.dart';

class BookFailureWithCached {
  final Failure failure;
  final List<BookEntity> cachedBooks;

  BookFailureWithCached({
    required this.failure,
    required this.cachedBooks,
  });
}
