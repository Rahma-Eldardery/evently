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
        borderSide: BorderSide(color: Color(0xFFF0F0F0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Color(0xFFF0F0F0)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Color(0xFFF0F0F0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide(color: Color(0xFFF0F0F0)),
      ),
    ),
    scaffoldBackgroundColor: Color(0xFFF4F7FF),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        backgroundColor: Color(0xFF0E3A99),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(0xFF686868).withValues(alpha: 0.2)),
        ),
      ),
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF686868)),
      labelMedium: GoogleFonts.poppins(fontSize: 18, color: Color(0xFF0E3A99)),
      labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Color(0xFF000F30),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        backgroundColor: Color(0xFF0E3A99),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: Color(0xFF686868).withValues(alpha: 0.2)),
        ),
      ),
    ),

    textTheme: TextTheme(
      titleLarge: GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: GoogleFonts.poppins(fontSize: 16, color: Color(0xFF686868)),
      labelMedium: GoogleFonts.poppins(fontSize: 18, color: Color(0xFF0E3A99)),
      labelSmall: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
    ),
  );
}
