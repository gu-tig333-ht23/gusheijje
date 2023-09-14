import 'package:flutter/material.dart';
import 'Components/mainTheme.dart';
import 'package:provider/provider.dart';
import 'Components/TodoProvider.dart';
import 'Components/todoListProvider.dart';
import 'Components/ThemeProvider.dart';
import 'Components/todoHome.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TodoProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => TodoListProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
    ],
    child: MaterialApp(
      home: const TodoApp(),
      theme: appTheme,
    ),
  ));
}
