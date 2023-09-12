import 'package:flutter/material.dart';
import './pages/todoHome.dart';
import 'Components/mainTheme.dart';
import 'package:provider/provider.dart';
import './Components/todo.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoNotifier(),
      child: MaterialApp(
        title: 'Todo',
        home: TodoHome(),
        theme: appTheme,
      ),
    ),
  );
}



