import 'package:bookly/core/entities/book_entity.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions.dart';

abstract class SearchRemoteDataSource {
  Future<List<BookEntity>> fetchSearchResultBooks({
    required String searchKey,
    int pageNumber = 0,
  });
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  final ApiService apiService;

  SearchRemoteDataSourceImpl({required this.apiService});

  @override
  Future<List<BookEntity>> fetchSearchResultBooks({
    required String searchKey,
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
        endPoint: 'volumes?q=$searchKey&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksListFromJson(data);
    return books;
  }
}
