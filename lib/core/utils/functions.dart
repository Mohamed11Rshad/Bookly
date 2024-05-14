import 'package:bookly/core/models/book_model/book_model.dart';
import 'package:bookly/features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';
import 'package:url_launcher/url_launcher.dart';

void showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast
          .LENGTH_SHORT, // Duration for which the toast should be displayed (Toast.LENGTH_SHORT or Toast.LENGTH_LONG)
      gravity: ToastGravity.BOTTOM, // Toast gravity (TOP, BOTTOM, CENTER)
      timeInSecForIosWeb:
          1, // Time in seconds to display the toast for iOS and web
      backgroundColor: Colors.white
          .withOpacity(0.8), // Background color of the toast message
      textColor: Colors.black, // Text color of the toast message
      fontSize: 16.0 // Font size of the toast message
      );
}

Future<void> launchCustomUrl(String url) async {
  Uri uri = Uri.parse(
    url,
  );

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    showToast("Couldn't load URL");
  }
}

List<BookEntity> getBooksListFromJson(Map<String, dynamic> data) {
  List<BookEntity> books = [];
  if (data['items'] != null) {
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
    }
    return books;
  } else {
    return [];
  }
}

void cacheBoxData(List<BookEntity> books, String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.addAll(books);
}

void clearBoxData(String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  box.clear();
}

void deleteAllExceptLatest10(String boxName) {
  var box = Hive.box<BookEntity>(boxName);
  if (box.length <= 10) {
    return; // No need to delete if there are 10 or fewer items
  }

  var latest10Keys = box.keys.toList().sublist(box.length - 10);

  box.keys.toList().forEach((key) {
    if (!latest10Keys.contains(key)) {
      box.delete(key);
    }
  });
}

void showSnackbar(BuildContext context, {required String msg}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent.withAlpha(220),
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
