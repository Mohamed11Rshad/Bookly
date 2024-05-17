import 'package:bloc/bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/search/domain/use_cases/search_use_case.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  SearchCubit({required this.searchUseCase}) : super(SearchInitial());

  Future<void> fetchSearchResultBooks({
    required String searchKey,
    int pageNumber = 0,
  }) async {
    if (pageNumber == 0) {
      emit(SearchLoading());
    } else {
      emit(SearchPaginationLoading());
    }

    var result = await searchUseCase.invoke(searchKey, pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            SearchFailure(
              errMessage: failure.errMessage,
            ),
          );
        } else {
          SearchPaginationFailure(
            errMessage: failure.errMessage,
          );
        }
      },
      (books) => {
        emit(
          SearchSuccess(
            books: books,
            pageNumber: pageNumber,
            key: searchKey,
          ),
        )
      },
    );
  }

  void emitSearchInitialState() {
    emit(SearchInitial());
  }
}
