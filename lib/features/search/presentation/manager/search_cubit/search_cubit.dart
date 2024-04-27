import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  Future<void> fetchSearchResultBooks({
    required String searchKey,
  }) async {
    emit(SearchLoading());
    var result = await searchRepo.fetchSearchResultBooks(searchKey: searchKey);
    result.fold(
      (failure) {
        emit(
          SearchFailure(
            errMessage: failure.errMessage,
          ),
        );
      },
      (books) => {
        emit(
          SearchSuccess(
            books: books,
          ),
        )
      },
    );
  }
}
