import 'package:flutter/material.dart';
import 'package:module_architecture/common/theme/color.dart';

final ThemeData appThemeData = ThemeData.lerp(
  ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown)),
  ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)),
  0.2,
);

// final ThemeData appThemeData = ThemeData.dark().copyWith(
//   textTheme: ThemeData.dark().textTheme.apply(
//         bodyColor: Colors.white,
//         displayColor: Colors.white,
//         fontFamily: 'Archivo',
//       ),
//   appBarTheme: const AppBarTheme(
//     elevation: 0,
//     color: BACKGROUND,
//     titleTextStyle: TextStyle(
//       color: Colors.white,
//       fontSize: 16,
//     ),
//   ),
//   splashColor: Colors.transparent,
//   highlightColor: Colors.transparent,
//   splashFactory: NoSplash.splashFactory,
//   primaryColor: APP_COLOR,
//   dialogBackgroundColor: BACKGROUND,
// );

