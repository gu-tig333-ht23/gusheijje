import 'package:flutter/material.dart';
import 'Components/main_theme.dart';
import 'package:provider/provider.dart';
import 'Components/todo_provider.dart';
import 'Components/todo_list_provider.dart';
import 'Components/theme_provider.dart';
import 'Components/todo_home.dart';

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
      home: TodoApp(),
      theme: appTheme,
    ),
  ));
}
