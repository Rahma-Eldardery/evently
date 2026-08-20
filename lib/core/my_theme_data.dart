import 'package:evently/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.stroke),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.stroke),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.stroke),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.stroke),
      ),
    ),
    scaffoldBackgroundColor: AppColorsConstants.backgroundColor,
    cardColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        backgroundColor: AppColorsConstants.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColorsConstants.grey.withValues(alpha: 0.2),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColorsConstants.mainText,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: AppColorsConstants.secText,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 18,
        color: AppColorsConstants.mainColor,
      ),
      labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColorsConstants.inputs,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
    ),
    inputDecorationTheme: InputDecorationThemeData(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.strokeDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.mainColorDark),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.strokeDark),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: AppColorsConstants.strokeDark),
      ),
      hintStyle: TextStyle(color: AppColorsConstants.secTextDark),
    ),
    scaffoldBackgroundColor: AppColorsConstants.backgroundColorDark,
    cardColor: AppColorsConstants.inputs,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        backgroundColor: AppColorsConstants.mainColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColorsConstants.grey.withValues(alpha: 0.2),
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColorsConstants.mainTextDark,
      ),
      titleMedium: GoogleFonts.poppins(
        fontSize: 16,
        color: AppColorsConstants.secTextDark,
      ),
      labelMedium: GoogleFonts.poppins(
        fontSize: 18,
        color: AppColorsConstants.mainColorDark,
      ),
      labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    ),
  );
}
