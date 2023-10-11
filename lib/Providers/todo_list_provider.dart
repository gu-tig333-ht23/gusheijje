//This file manages the todo list states
import 'package:flutter/material.dart';
import '../Components/todo.dart';
import '../Components/api.dart' as api;

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
    _items = _delayedFuture(0).then((_) => api.getListFromAPI());
    notifyListeners();
  }

  removeItem(String id) async {
    List<Todo> items = await api.removeItem(id);
    _items = Future.value(items);
    if (items[0].id == 'error') {
      print(items[0].id);
      notifyListeners();
    } else {}
  }

  addTodo(String name) {
    _items = _delayedFuture(0).then((_) => api.addTodo(name));
    notifyListeners();
  }

  void toggleTodoCompletion(Todo todo) async {
    final startTid = DateTime.now();
    todo.done = todo.done ? false : true;
    await api.toggleTodoCompletion(todo);
    final slutTid = DateTime.now();
    final totalTid = slutTid.difference(startTid);

    if (totalTid < Duration(milliseconds: 300)) {
      final remainingDelay =
          (Duration(milliseconds: 300) - totalTid).inMilliseconds;
      _delayedFuture(remainingDelay).then((_) => notifyListeners());
    } else {
      notifyListeners();
    }
  }
}
