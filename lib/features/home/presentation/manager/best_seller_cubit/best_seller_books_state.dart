part of 'best_seller_books_cubit.dart';

sealed class BestSellerBooksState extends Equatable {
  const BestSellerBooksState();

  @override
  List<Object> get props => [];
}

final class BestSellerBooksInitial extends BestSellerBooksState {}

final class BestSellerBooksLoading extends BestSellerBooksState {}

final class BestSellerBooksPaginationLoading extends BestSellerBooksState {}

final class BestSellerBooksFailure extends BestSellerBooksState {
  final String errMessage;
  final List<BookEntity> cachedBooks;

  const BestSellerBooksFailure({
    required this.errMessage,
    required this.cachedBooks,
  });
}

final class BestSellerBooksPaginationFailure extends BestSellerBooksState {
  final String errMessage;

  const BestSellerBooksPaginationFailure({required this.errMessage});
}

final class BestSellerBooksSuccess extends BestSellerBooksState {
  final List<BookEntity> books;

  const BestSellerBooksSuccess({required this.books});
}
