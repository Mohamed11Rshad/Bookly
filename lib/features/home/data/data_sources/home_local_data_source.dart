import 'package:bookly/constants.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> fetchBestSellerBooks({int pageNumber = 0});
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0});
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntity> fetchBestSellerBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    var box = Hive.box<BookEntity>(kBestSellerBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) return [];
    return box.values.toList().sublist(
          startIndex,
          endIndex,
        );
  }

  @override
  List<BookEntity> fetchFeaturedBooks({int pageNumber = 0}) {
    int startIndex = pageNumber * 10;
    int endIndex = (pageNumber + 1) * 10;
    Box<BookEntity> box = Hive.box<BookEntity>(kFeaturedBox);
    int length = box.values.length;
    if (startIndex >= length || endIndex > length) return [];

    return box.values.toList().sublist(
          startIndex,
          endIndex,
        );
  }
}
