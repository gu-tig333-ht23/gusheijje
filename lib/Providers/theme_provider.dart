//This file provides styling/theme data
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkMode = true; //variable for dark mode and light mode toggle

  bool get darkMode => _darkMode;

  //general
  Color get mainColor => _darkMode
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get iconAdd => _darkMode
      ? const Color.fromARGB(255, 49, 174, 243)
      : const Color.fromARGB(255, 49, 174, 243);

  //appbar
  Color get appBarBgColor => _darkMode
      ? Color.fromARGB(255, 139, 0, 203)
      : const Color.fromARGB(255, 128, 155, 206);

  Color get appBarTxColor => _darkMode
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromRGBO(255, 255, 255, 1);

  //backgrund
  Color get background => _darkMode
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color.fromARGB(255, 240, 242, 245);

  Color get backgroundTwo => _darkMode
      ? const Color.fromARGB(255, 81, 81, 81)
      : const Color.fromRGBO(255, 255, 255, 1);

  //todolist
  Color get todoTileColor => _darkMode
      ? const Color.fromARGB(255, 30, 30, 30)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get todoTileTxColor => _darkMode
      ? const Color.fromRGBO(255, 255, 255, 1)
      : const Color.fromARGB(255, 0, 0, 0);

  Color get todoTileTxColorDone => const Color.fromARGB(255, 138, 138, 138);

  //checkBox
  Color get checkBoxBorderColor => _darkMode
      ? const Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(0, 0, 0, 1);

  //BottomBar
  Color get bottomBarColor => _darkMode
      ? const Color.fromARGB(255, 0, 0, 0)
      : const Color.fromARGB(255, 240, 242, 245);

  Color get bottomBarBorderColor => _darkMode
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(150, 0, 0, 0);

  Color get BottomBarIconColor => _darkMode
      ? const Color.fromARGB(255, 255, 255, 255)
      : const Color.fromARGB(255, 138, 138, 138);

  //Here is the toggle to switch between dark mode and light mode
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
