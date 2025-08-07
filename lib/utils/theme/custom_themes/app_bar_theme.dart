import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SAppBarTheme {
  SAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    backgroundColor: SColors.lightAppBarBgColor,
    foregroundColor: SColors.lightText,
  );

  static const darkAppBarTheme = AppBarTheme(
    backgroundColor: SColors.darkAppBarBgColor,
    foregroundColor: SColors.lightText,
  );
}
