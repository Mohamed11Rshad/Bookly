import 'package:bloc/bloc.dart';
import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/best_seller_books_use_case.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_books_state.dart';

class BestSellerBooksCubit extends Cubit<BestSellerBooksState> {
  BestSellerBooksCubit(this.bestSellerBooksUseCase)
      : super(BestSellerBooksInitial());
  final BestSellerBooksUseCase bestSellerBooksUseCase;
  Future<void> fetchBestSellerBooks({pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(BestSellerBooksLoading());
    } else {
      emit(BestSellerBooksPaginationLoading());
    }
    var result = await bestSellerBooksUseCase.invoke(pageNumber);
    result.fold(
      (booksFailure) {
        if (pageNumber == 0) {
          emit(
            BestSellerBooksFailure(
              errMessage: booksFailure.failure.errMessage,
              cachedBooks: booksFailure.cachedBooks,
            ),
          );
        } else {
          emit(
            BestSellerBooksPaginationFailure(
              errMessage: booksFailure.failure.errMessage,
            ),
          );
        }
      },
      (books) => {
        emit(
          BestSellerBooksSuccess(
            books: books,
          ),
        )
      },
    );
  }
}
