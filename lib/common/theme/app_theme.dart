import 'package:flutter/material.dart';

import 'color.dart';

abstract class AppTheme {
  static final theme = ThemeData(
      brightness: Brightness.light,
      visualDensity: VisualDensity.standard,
      useMaterial3: true,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: buttonStyle),
      textButtonTheme: TextButtonThemeData(style: buttonStyle),
      outlinedButtonTheme: OutlinedButtonThemeData(style: buttonStyle),
      colorScheme: ColorScheme.fromSeed(seedColor: APP_COLOR));
}

final buttonStyle = ButtonStyle(
  padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
  shape: MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  ),
);
