import 'package:bloc/bloc.dart';
import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  void emitNoSimilar() {
    emit(
      SimilarBooksNoSimilar(),
    );
  }

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (failure) {
        emit(
          SimilarBooksFailure(
            errMessage: failure.errMessage,
          ),
        );
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
