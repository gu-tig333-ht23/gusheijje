//handles the filtering of the todo list
import 'package:flutter/material.dart';

class TodoFilterProvider extends ChangeNotifier {
  String _todoFilter = 'all';

  String get todoFilter => _todoFilter;

  set todoFilter(String filter) {
    _todoFilter = filter;
    notifyListeners();
  }
}
