//denna fillen har Theme data för appen,
//men den är inte längre nödvändig då den upgiften hanteras av themeProvider.dart
import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Color.fromARGB(255, 17, 17, 17),
  popupMenuTheme: PopupMenuThemeData(
    color: Color.fromRGBO(30, 30, 30, 0.5),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Color.fromARGB(255, 187, 134, 252), width: 1),
    ),
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 30, 30, 30),
    titleTextStyle: TextStyle(color: const Color.fromARGB(255, 187, 134, 252)),
  ),
);
