import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Components/main_theme.dart';
import 'Providers/todo_filter_provider.dart';
import 'Providers/todo_list_provider.dart';
import 'Providers/theme_provider.dart';
import 'Pages/todo_home.dart';

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
