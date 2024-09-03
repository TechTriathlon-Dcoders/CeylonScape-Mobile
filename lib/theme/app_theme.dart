import 'package:CeylonScape/theme/dynamic_colors.dart';
import 'package:flutter/material.dart';

import 'colors.dart';

class AppTheme {
  // static final ThemeData lightTheme = ThemeData(
  //   // set global font
  //   fontFamily: 'Open Sans',
  //   colorScheme: ColorScheme.fromSeed(
  //     seedColor: CeylonScapeColor.secondaryColor,
  //     primary: CeylonScapeColor.primaryColor,
  //   ),
  //   primaryColor: CeylonScapeColor.primaryColor,
  //   primaryColorDark: CeylonScapeColor.primaryColor,
  //   primaryColorLight: CeylonScapeColor.secondaryColor,
  //   dividerColor: CeylonScapeColor.lightGrey,
  //   textSelectionTheme: const TextSelectionThemeData(
  //     cursorColor: CeylonScapeColor.primaryColor,
  //     selectionColor: CeylonScapeColor.secondaryColor,
  //     selectionHandleColor: CeylonScapeColor.secondaryColor,
  //   ),
  //   visualDensity: VisualDensity.adaptivePlatformDensity,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: CeylonScapeColor.white,
  //     foregroundColor: CeylonScapeColor.titleTextColor,
  //     elevation: 0,
  //     shadowColor: Colors.transparent,
  //     toolbarHeight: 80,
  //   ),
  //   // brightness: Brightness.dark,
  //   // Other Colors
  //   splashColor: CeylonScapeColor.primaryColor.withAlpha(50),
  //   indicatorColor: CeylonScapeColor.lightGrey,
  //   highlightColor: CeylonScapeColor.lightGrey,
  //   scaffoldBackgroundColor: CeylonScapeColor.bgColor
  // );

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: CeylonScapeColor.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: CeylonScapeColor.primary,
        primary: CeylonScapeColor.primary,
      ),
      scaffoldBackgroundColor: CeylonScapeColor.black0,
      dividerColor: CeylonScapeColor.black10,

      appBarTheme: const AppBarTheme(
        backgroundColor: CeylonScapeColor.black0,
        foregroundColor: CeylonScapeColor.black,
        elevation: 0,
        shadowColor: Colors.transparent,
        toolbarHeight: 80,
      ),

      extensions: const <ThemeExtension<dynamic>>[
        DynamicColors(
            black: CeylonScapeColor.black,
            black95: CeylonScapeColor.black95,
            black90: CeylonScapeColor.black90,
            black80: CeylonScapeColor.black80,
            black70: CeylonScapeColor.black70,
            black60: CeylonScapeColor.black60,
            black50: CeylonScapeColor.black50,
            black40: CeylonScapeColor.black40,
            black30: CeylonScapeColor.black30,
            black20: CeylonScapeColor.black20,
            black10: CeylonScapeColor.black10,
            black5: CeylonScapeColor.black5,
            black0: CeylonScapeColor.black0
        )
      ],
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: CeylonScapeColor.primary,

    extensions: const <ThemeExtension<dynamic>>[
      DynamicColors(
          black: CeylonScapeColor.black0,
          black95: CeylonScapeColor.black5,
          black90: CeylonScapeColor.black10,
          black80: CeylonScapeColor.black20,
          black70: CeylonScapeColor.black30,
          black60: CeylonScapeColor.black40,
          black50: CeylonScapeColor.black50,
          black40: CeylonScapeColor.black60,
          black30: CeylonScapeColor.black70,
          black20: CeylonScapeColor.black80,
          black10: CeylonScapeColor.black90,
          black5: CeylonScapeColor.black95,
          black0: CeylonScapeColor.black
      ),
    ],
  );
}
