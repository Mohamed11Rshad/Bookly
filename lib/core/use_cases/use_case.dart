import 'package:dartz/dartz.dart';

abstract class UseCase<C, T, E> {
  Future<Either<C, T>> invoke(E param);
}
