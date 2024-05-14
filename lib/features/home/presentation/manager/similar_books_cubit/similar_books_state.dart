part of 'similar_books_cubit.dart';

sealed class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

final class SimilarBooksInitial extends SimilarBooksState {}

final class SimilarBooksLoading extends SimilarBooksState {}

final class SimilarBooksPaginationLoading extends SimilarBooksState {}

final class SimilarBooksNoSimilar extends SimilarBooksState {}

final class SimilarBooksFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksFailure({required this.errMessage});
}

final class SimilarBooksPaginationFailure extends SimilarBooksState {
  final String errMessage;

  const SimilarBooksPaginationFailure({required this.errMessage});
}

final class SimilarBooksSuccess extends SimilarBooksState {
  final List<BookEntity> books;

  const SimilarBooksSuccess({required this.books});
}
