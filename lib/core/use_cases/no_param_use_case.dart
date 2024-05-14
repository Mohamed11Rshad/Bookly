import 'package:bookly/core/errors/bookFailureWithCached.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<T> {
  Future<Either<BookFailureWithCached, T>> invoke();
}
