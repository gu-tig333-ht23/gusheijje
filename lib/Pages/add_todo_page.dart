//This file manages the page for adding a new task
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/todo_list_provider.dart';
import '../Providers/theme_provider.dart';
import '../UI/home_appbar.dart';

class AddTodoPage extends StatelessWidget {
  final TextEditingController todoAddTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().background,
      appBar: HomeAppBar(
        home: false,
      ),
      body: Container(
        color: context.watch<ThemeProvider>().background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: context.watch<ThemeProvider>().todoTileColor,
              margin: EdgeInsets.all(16.0),
              child: TextField(
                style: TextStyle(
                    color: context.watch<ThemeProvider>().todoTileTxColor),
                cursorColor: context.watch<ThemeProvider>().todoTileTxColor,
                controller: todoAddTextController,
                decoration: InputDecoration(
                  hintText: 'What are you going to do?',
                  hintStyle: TextStyle(color: Colors.grey),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.0, color: Color.fromARGB(0, 115, 0, 255)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 0.0, color: Color.fromARGB(0, 115, 0, 255)),
                  ),
                ),
              ),
            ),
            IconButton(
              iconSize: 80,
              padding: EdgeInsets.zero,
              onPressed: () {
                String newTodo = todoAddTextController.text.trim();
                if (newTodo.isNotEmpty) {
                  Provider.of<TodoListProvider>(context, listen: false)
                      .addTodo(newTodo);
                  Navigator.of(context).pop();
                }
              },
              icon: Icon(
                Icons.add_circle,
                color: context.watch<ThemeProvider>().iconAdd,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
