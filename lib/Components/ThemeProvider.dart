//Denna filen tillhandahåller styling/theme data
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _darkMode = true; //variabel för dark mode och light mode toggel

  //allmänt
  Color get mainColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(255, 171, 64, 1);

  Color get iconAdd => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(255, 171, 64, 1);

  //appbar
  Color get appBarBgColor => _darkMode
      ? Color.fromARGB(255, 30, 30, 30)
      : Color.fromARGB(255, 187, 134, 252);

  Color get appBarTxColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(255, 255, 255, 1);

  //backgrund
  Color get background => _darkMode
      ? Color.fromARGB(255, 17, 17, 17)
      : Color.fromARGB(255, 187, 134, 252);

  Color get backgroundTwo => _darkMode
      ? Color.fromARGB(255, 81, 81, 81)
      : const Color.fromRGBO(255, 255, 255, 1);

  //todo listan
  Color get todoTileColor => _darkMode
      ? Color.fromARGB(255, 46, 46, 46)
      : const Color.fromRGBO(255, 255, 255, 1);

  Color get todoTileTxColor => _darkMode
      ? const Color.fromRGBO(255, 255, 255, 1)
      : const Color.fromRGBO(0, 0, 0, 1);

  //checkBox
  Color get checkBoxBorderColor => _darkMode
      ? Color.fromARGB(255, 187, 134, 252)
      : const Color.fromRGBO(0, 0, 0, 1);

  //Här är toggeln för att växla mellan dark mode och light mode
  void toggleDarkMode() {
    _darkMode = !_darkMode;
    notifyListeners();
  }
}
