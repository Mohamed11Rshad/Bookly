import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const textStyle24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  static TextStyle numTextStyle22 = GoogleFonts.acme(
    fontSize: 24,
  );
  static TextStyle numTextStyle20 = GoogleFonts.acme(
    fontSize: 22,
  );
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static const textStyle32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.normal,
  );
}
