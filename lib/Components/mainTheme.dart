import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  brightness: Brightness.dark, 
  primarySwatch: Colors.orange,
  scaffoldBackgroundColor: Color.fromARGB(255, 12, 81, 110),

  popupMenuTheme: PopupMenuThemeData(
    color: Color.fromARGB(150, 0, 40, 63),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(color: Colors.orange, width: 1),
    ),
  ),

  appBarTheme: AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 40, 63),
    titleTextStyle: TextStyle(color: Colors.orange),
  ),
);
