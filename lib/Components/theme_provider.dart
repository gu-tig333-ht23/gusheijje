//This file provides styling/theme data
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkMode = true; //variable for dark mode and light mode toggle

  bool get darkMode => _darkMode;

  //general
  Color get mainColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromARGB(255, 255, 255, 255);

  Color get iconAdd => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromARGB(255, 230, 75, 59);

  //appbar
  Color get appBarBgColor => _darkMode
      ? Color.fromARGB(255, 30, 30, 30)
      : Color.fromARGB(255, 128, 155, 206);

  Color get appBarTxColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(255, 255, 255, 1);

  //backgrund
  Color get background => _darkMode
      ? Color.fromARGB(255, 17, 17, 17)
      : Color.fromARGB(255, 149, 184, 209);

  Color get backgroundTwo => _darkMode
      ? Color.fromARGB(255, 81, 81, 81)
      : const Color.fromRGBO(255, 255, 255, 1);

  //todo listan
  Color get todoTileColor => _darkMode
      ? Color.fromARGB(255, 46, 46, 46)
      : const Color.fromARGB(255, 255, 192, 0);

  Color get todoTileTxColor => _darkMode
      ? const Color.fromRGBO(255, 255, 255, 1)
      : const Color.fromRGBO(255, 255, 255, 1);

  //checkBox
  Color get checkBoxBorderColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(0, 0, 0, 1);

  //Here is the toggle to switch between dark mode and light mode
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
