//This file manages the todo list states
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

  Future<void> _delayedFuture(time) async {
    await Future.delayed(Duration(milliseconds: time));
  }

  getList() {
    _items = _delayedFuture(2000).then((_) => api.getListFromAPI());
    notifyListeners();
  }

  removeItem(String id) {
    _items = api.removeItem(id);
    //notifyListeners();
  }

  addTodo(String name) {
    _items = _delayedFuture(2000).then((_) => api.addTodo(name));
    notifyListeners();
  }

  void toggleTodoCompletion(Todo todo) {
    todo.done = todo.done ? false : true;
    api.toggleTodoCompletion(todo);
    _delayedFuture(200).then((_) => notifyListeners());
  }
}
