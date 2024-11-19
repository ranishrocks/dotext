import 'package:flutter/material.dart';

ThemeData normalThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    elevation: 0,
  ),
  scaffoldBackgroundColor: Colors.white,
  brightness: Brightness.light,
);

ThemeData darkThemeData = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.black,
    elevation: 0,
  ),
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,
);
