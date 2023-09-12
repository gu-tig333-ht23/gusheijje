

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:provider/provider.dart';

class Todo {
  final String name;
  bool isChecked;
  final String id;

  Todo(this.id, this.name, {this.isChecked = false});
}

class TodoNotifier extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  TodoNotifier() {
    _initializeTodos();
  }

  void addTodo(String name) {
  final todo = Todo(Uuid().v4(), name); // Generate a new ID for the todo
  _todos.add(todo);
  notifyListeners();
  }

  void removeTodo(Todo todo) {
    print('rem');
    print(_todos);
    _todos.remove(todo);
    notifyListeners();
    print(_todos);
  }

  void toggleTodo(Todo todo) {
    print('tog');
    todo.isChecked = !todo.isChecked;
    notifyListeners();
  }

  void _initializeTodos() {
    _todos.add(Todo(Uuid().v4(), 'one'));
    _todos.add(Todo(Uuid().v4(), 'two'));
  }
} 

void add(context, String name) {
final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
todoNotifier.addTodo(name);
}

void removeTodo(context, Todo todo) {
final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
todoNotifier.removeTodo(todo);
}

void toggleTodoState(context,Todo todo) {
final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
todoNotifier.toggleTodo(todo);
}