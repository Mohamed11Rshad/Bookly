import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:bookly/core/utils/functions.dart';
import 'package:bookly/core/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchBestSellerBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0});
  Future<List<BookEntity>> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  });
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchBestSellerBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&q=doctor&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksListFromJson(data);
    if (books.length == 10) {
      clearBoxData(kBestSellerBox);
      cacheBoxData(books, kBestSellerBox);
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber = 0}) async {
    var data = await apiService.get(
        endPoint: 'volumes?q=technology&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksListFromJson(data);
    if (books.length == 10) {
      clearBoxData(kFeaturedBox);
      cacheBoxData(books, kFeaturedBox);
    }
    return books;
  }

  @override
  Future<List<BookEntity>> fetchSimilarBooks({
    required String category,
    int pageNumber = 0,
  }) async {
    var data = await apiService.get(
        endPoint:
            'volumes?q=$category&Sorting=relevance&startIndex=${pageNumber * 10}');
    List<BookEntity> books = getBooksListFromJson(data);

    return books;
  }
}
