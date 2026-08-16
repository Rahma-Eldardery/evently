import 'package:evently/core/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  AppColors colors = LightColor();

  changeTheme(ThemeMode mode) {
    themeMode = mode;
    if (mode == ThemeMode.dark) {
      colors = DarkColor();
    } else {
      colors = LightColor();
    }
    notifyListeners();
  }
}
