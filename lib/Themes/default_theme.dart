import 'package:flutter/material.dart';

class DefaultTheme {
  static final ThemeData defaultTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(backgroundColor: Color.fromARGB(0, 50, 151, 129)),
    elevatedButtonTheme:
        ElevatedButtonThemeData(style: TextButton.styleFrom(backgroundColor: Color.fromRGBO(111, 84, 226, 1))),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color.fromARGB(134, 84, 5, 121)),
  );
}
