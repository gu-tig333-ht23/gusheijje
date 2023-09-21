//Denna filen hanterar todo listan
import 'package:flutter/material.dart';
import 'todo.dart';
import 'api.dart' as api;

class TodoListProvider extends ChangeNotifier {
  Future<List<Todo>> _items =
      Future.value([Todo(title: 'test', id: '0', done: false)]);

  TodoListProvider() {
    getList();
  }

  Future<List<Todo>> get items => _items;

  String _todoFilter = 'all';
  String get todoFilter => _todoFilter;
  set todoFilter(String item) {
    _todoFilter = item;
    notifyListeners();
  }

  Future<void> _delayedFuture() async {
    await Future.delayed(Duration(seconds: 2));
  }

  getList() {
    _items = api.getListFromAPI();
    notifyListeners();
  }

  removeItem(String id) {
    _items = api.removeItem(id);
    notifyListeners();
  }

  addTodo(String name) {
    _items = _delayedFuture().then((_) => api.addTodo(name));
    notifyListeners();
  }

  void toggleTodoCompletion(Todo todo) {
    print(todo);
    todo.done = todo.done ? false : true;

    api.toggleTodoCompletion(todo);
    print('toggle');
    notifyListeners();
  }
}
