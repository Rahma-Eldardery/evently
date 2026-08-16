import 'package:flutter/material.dart';

abstract class AppColors {
  Color primaryColor();
  Color greyColor();
}

class LightColor implements AppColors {
  @override
  Color primaryColor() {
    return Color(0xFF0E3A99);
  }

  @override
  Color greyColor() {
    return Color(0xFF686868);
  }
}

class DarkColor implements AppColors {
  @override
  Color greyColor() {
    return Color(0xFF686868);
  }

  @override
  Color primaryColor() {
    return Colors.white;
  }
}
