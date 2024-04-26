import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
