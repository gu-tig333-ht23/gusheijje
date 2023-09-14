import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkMode = true;

  Color get appBarBgColor => _darkMode
      ? Color.fromARGB(255, 30, 30, 30)
      : Color.fromARGB(255, 187, 134, 252);
  Color get appBarTxColor =>
      _darkMode ? Color.fromARGB(255, 187, 134, 252) : Colors.white;

  Color get background => _darkMode
      ? Color.fromARGB(255, 17, 17, 17)
      : Color.fromARGB(255, 187, 134, 252);
  Color get backgroundTwo =>
      _darkMode ? Color.fromARGB(255, 81, 81, 81) : Colors.white;

  Color get mainColor =>
      _darkMode ? Color.fromARGB(255, 187, 134, 252) : Colors.orangeAccent;
  Color get todoTileColor =>
      _darkMode ? Color.fromARGB(255, 46, 46, 46) : Colors.white;
  Color get todoTileTxColor => _darkMode ? Colors.white : Colors.black;
  Color get iconAdd =>
      _darkMode ? Color.fromARGB(255, 187, 134, 252) : Colors.orangeAccent;
  Color get checkBoxBorderColor =>
      _darkMode ? Color.fromARGB(255, 187, 134, 252) : Colors.black;

  void toggleDarkMode() {
    ThemeProvider();
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
