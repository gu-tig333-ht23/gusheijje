import 'package:flutter/material.dart';

class AddTodoPage extends StatelessWidget {
  final Function(String) addTodoCallback;

  AddTodoPage(this.addTodoCallback);

  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TIG333 TODO'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(16.0),
            child: TextField(
              controller: _todoController,
              decoration: InputDecoration(
                hintText: 'What are you going to do?',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              String newTodo = _todoController.text.trim();
              if (newTodo.isNotEmpty) {
                addTodoCallback(newTodo);
                Navigator.of(context).pop();
              }
            },
            child: Text('+ ADD'),
          ),
        ],
      ),
    );
  }
}
