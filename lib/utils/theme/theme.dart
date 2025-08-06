import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: SColors.light,
    textTheme: STextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SColors.dark,
    textTheme: STextTheme.darkTextTheme,
  );
}
