import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier {
  String _todoFilter = 'all';

  String get todoFilter => _todoFilter;

  set todoFilter(String filter) {
    _todoFilter = filter;
    notifyListeners();
  }
}
