import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'custom_themes/app_bar_theme.dart';
import 'custom_themes/navigation_bar_theme.dart';
import 'custom_themes/text_theme.dart';

class SAppTheme {
  SAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: SColors.light,
    textTheme: STextTheme.lightTextTheme,
    appBarTheme: SAppBarTheme.lightAppBarTheme,
    navigationBarTheme: SNavigationBarTheme.lightNavBarTheme,
    cardColor: SColors.lightCard,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: SColors.dark,
    textTheme: STextTheme.darkTextTheme,
    appBarTheme: SAppBarTheme.darkAppBarTheme,
    navigationBarTheme: SNavigationBarTheme.darkNavBarTheme,
    cardColor: SColors.darkCard,
  );
}
