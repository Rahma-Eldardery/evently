import 'package:flutter/material.dart';

class AppColorsConstants {
  static const Color mainColor = Color(0xFF0E3A99);
  static const Color mainColorDark = Color(0xFF457AED);

  static const Color mainText = Colors.black;
  static const Color secText = Color(0xFF686868);
  static const Color mainTextDark = Colors.white;
  static const Color secTextDark = Color(0xFFD6D6D6);

  static const Color backgroundColor = Color(0xFFF4F7FF);
  static const Color backgroundColorDark = Color(0xFF000F30);

  static const Color stroke = Color(0xFFF0F0F0);
  static const Color strokeDark = Color(0xFF002D8F);

  static const Color inputs = Color(0xFF001440);

  static const Color grey = Color(0xFF686868);
  static const Color greyDark = Color(0xFFD6D6D6);
}

abstract class AppColors {
  Color primaryColor();
  Color mainTextColor();
  Color secTextColor();
  Color backgroundColor();
  Color strokeColor();
  Color inputColor();
  Color greyColor();
}

class LightColor implements AppColors {
  @override
  Color primaryColor() => AppColorsConstants.mainColor;

  @override
  Color mainTextColor() => AppColorsConstants.mainText;

  @override
  Color secTextColor() => AppColorsConstants.secText;

  @override
  Color backgroundColor() => AppColorsConstants.backgroundColor;

  @override
  Color strokeColor() => AppColorsConstants.stroke;

  @override
  Color inputColor() => Colors.white;

  @override
  Color greyColor() => AppColorsConstants.grey;
}

class DarkColor implements AppColors {
  @override
  Color primaryColor() => AppColorsConstants.mainColorDark;

  @override
  Color mainTextColor() => AppColorsConstants.mainTextDark;

  @override
  Color secTextColor() => AppColorsConstants.secTextDark;

  @override
  Color backgroundColor() => AppColorsConstants.backgroundColorDark;

  @override
  Color strokeColor() => AppColorsConstants.strokeDark;

  @override
  Color inputColor() => AppColorsConstants.inputs;

  @override
  Color greyColor() => AppColorsConstants.greyDark;
}