import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/similar_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.similarBooksUseCase) : super(SimilarBooksInitial());
  final SimilarBooksUseCase similarBooksUseCase;

  Future<void> fetchSimilarBooks({
    required String? category,
    int pageNumber = 0,
  }) async {
    if (category == null) {
      emit(
        SimilarBooksNoSimilar(),
      );
    } else {
      emit(SimilarBooksLoading());

      if (pageNumber == 0) {
      } else {
        emit(SimilarBooksPaginationLoading());
      }

      var result = await similarBooksUseCase.invoke(category, pageNumber);
      result.fold(
        (failure) {
          if (pageNumber == 0) {
            emit(
              SimilarBooksFailure(
                errMessage: failure.errMessage,
              ),
            );
          } else {
            emit(
              SimilarBooksPaginationFailure(errMessage: failure.errMessage),
            );
          }
        },
        (books) => {
          emit(
            SimilarBooksSuccess(
              books: books,
            ),
          )
        },
      );
    }
  }
}
