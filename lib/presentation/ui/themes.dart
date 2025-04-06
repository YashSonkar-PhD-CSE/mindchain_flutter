import 'package:flutter/material.dart';
import 'package:mindchain/presentation/ui/typography.dart';

final darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Color.fromARGB(255, 101, 85, 143),
    onPrimary: Color.fromARGB(255, 255, 255, 255),
    primaryContainer: Color.fromARGB(255, 234, 221, 255),
    onPrimaryContainer: Color.fromARGB(255, 33, 0, 93),
    secondary: Color.fromARGB(255, 98, 91, 113),
    onSecondary: Color.fromARGB(255, 255, 255, 255),
    secondaryContainer: Color.fromARGB(255, 232, 222, 248),
    onSecondaryContainer: Color.fromARGB(255, 255, 216, 228),
    tertiary: Color.fromARGB(255, 125, 82, 96),
    onTertiary: Color.fromARGB(255, 255, 255, 255),
    tertiaryContainer: Color.fromARGB(255, 255, 216, 228),
    onTertiaryContainer: Color.fromARGB(255, 49, 17, 29),
    error: Color.fromARGB(255, 179, 38, 30),
    onError: Color.fromARGB(255, 255, 255, 255),
    errorContainer: Color.fromARGB(255, 249, 222, 220),
    onErrorContainer: Color.fromARGB(255, 65, 14, 11),
    surface: Color.fromARGB(255, 255, 255, 255),
    onSurface: Color.fromARGB(255, 0, 0, 0),
  ),
  textTheme: typography,
);

final lightTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromARGB(255, 208, 188, 255),
    onPrimary: Color.fromARGB(255, 56, 30, 114),
    primaryContainer: Color.fromARGB(255, 79, 55, 139),
    onPrimaryContainer: Color.fromARGB(255, 234, 221, 255),
    secondary: Color.fromARGB(255, 204, 194, 220),
    onSecondary: Color.fromARGB(255, 51, 45, 65),
    secondaryContainer: Color.fromARGB(255, 74, 68, 88),
    onSecondaryContainer: Color.fromARGB(255, 232, 222, 248),
    tertiary: Color.fromARGB(255, 239, 184, 200),
    onTertiary: Color.fromARGB(255, 73, 37, 50),
    tertiaryContainer: Color.fromARGB(255, 99, 59, 72),
    onTertiaryContainer: Color.fromARGB(255, 255, 216, 228),
    error: Color.fromARGB(255, 242, 184, 181),
    onError: Color.fromARGB(255, 96, 20, 16),
    errorContainer: Color.fromARGB(255, 140, 29, 24),
    onErrorContainer: Color.fromARGB(255, 249, 222, 220),
    surface: Color.fromARGB(255, 20, 18, 24),
    onSurface: Color.fromARGB(255, 230, 224, 233),
  ),
  textTheme: typography,
);
