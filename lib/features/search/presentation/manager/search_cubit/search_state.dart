part of 'search_cubit.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchPaginationLoading extends SearchState {}

final class SearchFailure extends SearchState {
  final String errMessage;
  const SearchFailure({required this.errMessage});
}

final class SearchPaginationFailure extends SearchState {
  final String errMessage;
  const SearchPaginationFailure({required this.errMessage});
}

final class SearchSuccess extends SearchState {
  final List<BookEntity> books;
  final int pageNumber;
  final String key;
  const SearchSuccess({
    required this.books,
    required this.pageNumber,
    required this.key,
  });
}
