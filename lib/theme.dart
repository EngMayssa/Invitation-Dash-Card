import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.tajawal(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),

    bodyText2: GoogleFonts.tajawal(
      fontSize: 12.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline1: GoogleFonts.tajawal(
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline2: GoogleFonts.tajawal(
      fontSize: 13.0,
      fontWeight: FontWeight.w700,
      color: Colors.lightBlue,
    ),
    headline3: GoogleFonts.tajawal(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.tajawal(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  );
  static ElevatedButtonThemeData lightElevetedButtonTheme =
  ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white54),
      foregroundColor: MaterialStateProperty.all(Colors.black),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.tajawal(
      fontSize: 14.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline1: GoogleFonts.tajawal(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: GoogleFonts.tajawal(
      fontSize: 21.0,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    ),
    headline3: GoogleFonts.tajawal(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    headline6: GoogleFonts.tajawal(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  );

  static ThemeData light() {
    return ThemeData(
        elevatedButtonTheme: lightElevetedButtonTheme,
        brightness: Brightness.light,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateColor.resolveWith((states) {
            return Colors.black;
          }),
        ),
        textTheme: lightTextTheme,
        primarySwatch: Colors.blueGrey);
  }
}

