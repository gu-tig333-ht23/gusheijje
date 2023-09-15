//Denna filen hanterar sidan för att lägga till en ny todo
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todoListProvider.dart';
import 'ThemeProvider.dart';

class AddTodoPage extends StatelessWidget {
  TextEditingController todoAddTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.watch<ThemeProvider>().appBarBgColor,
        title: Text(
          'TIG333 TODO',
          style: TextStyle(color: context.watch<ThemeProvider>().appBarTxColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: todoAddTextController,
              decoration: InputDecoration(
                hintText: 'What are you going to do?',
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 115, 0, 255)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: context.watch<ThemeProvider>().mainColor),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String newTodo = todoAddTextController.text.trim();
              if (newTodo.isNotEmpty) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .addItem(newTodo);
                Navigator.of(context).pop();
              }
            },
            child: Text(
              '+ ADD',
              style: TextStyle(color: context.watch<ThemeProvider>().mainColor),
            ),
          ),
        ],
      ),
    );
  }
}
