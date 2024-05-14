import 'package:dartz/dartz.dart';

abstract class UseCaseTwoParam<C, T, E ,F> {
  Future<Either<C, T>> invoke(E param , F param2);
}
