import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:bookly/features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_section.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(
    this.featuredBooksUseCase,
  ) : super(FeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;
  Future<void> fetchFeaturedBooks({pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(FeaturedBooksLoading());
    } else {
      emit(FeaturedBooksPaginationLoading());
    }
    var result = await featuredBooksUseCase.invoke(pageNumber);
    result.fold(
      (bookFailure) {
        if (pageNumber == 0) {
          emit(
            FeaturedBooksFailure(
                errMessage: bookFailure.failure.errMessage,
                cachedBooks: bookFailure.cachedBooks),
          );
        } else {
          emit(
            FeaturedBooksPaginationFailure(
              errMessage: bookFailure.failure.errMessage,
            ),
          );
        }
      },
      (books) {
        emit(
          FeaturedBooksSuccess(
            books: books,
          ),
        );
      },
    );
  }
}
