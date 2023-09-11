import 'package:flutter/material.dart';
import '../Components/todo.dart';
import '../pages/add.dart';

class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> { 
  List<Todo> todos = [
    Todo('test1'),
    Todo('test2'),
    Todo('test3'),
    Todo('test4'),
    Todo('test5'),
    Todo('test6'),
    Todo('test7'),
    Todo('test8'),
    Todo('test9'),
    Todo('test10'),
    Todo('test11'),
    Todo('test12'),
    Todo('test13'),
    Todo('test14'),
    Todo('test15'),
    Todo('test16'),
    Todo('test17'),
    Todo('test18'),
    Todo('test19'),
    Todo('test20'),
    Todo('test21'),
    Todo('test22'),
    Todo('test23'),
  ];

  void add(String name) {
    setState(() {
      todos.add(Todo(name));
    });
  }

  void removeTodo(Todo todo) {
    setState(() {
      todos.remove(todo);
    });
  }

  void _navigateToadd(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTodoPage(add),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final List<String> menuItems = ['all', 'done', 'undone'];

    return Scaffold(
      appBar: AppBar(
      flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              'TIG333 TODO',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 25,
              ),
            ),
          ),
        ),

        actions: [
            PopupMenuButton<String>(
              onSelected: (String selectedItem) {
                print('Selected: $selectedItem');
              },
              itemBuilder: (BuildContext context) {
                return menuItems.map((String item) {
                  return PopupMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList();
              },
              icon: Icon(Icons.more_vert, color: Colors.orange,),
            ),
          ],
      ),

      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.only(bottom: 80),
            children: todos.map((todo) => _todoItem(todo)).toList(),
          ),

          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              alignment: Alignment.center,
              iconSize: 80,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.add_circle, color: Colors.orange,),
              onPressed: () {
                _navigateToadd(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void toggleTodoState(int index) {
    setState(() {
      todos[index].isChecked = !todos[index].isChecked;
    });
  }

  Widget _todoItem(Todo todo) {
    return Container(
      decoration: BoxDecoration(
      border: Border(bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: 
              Row(
                children: [
                  Theme(
                    data: Theme.of(context).copyWith(
                      unselectedWidgetColor: Colors.white,
                    ),
                    child: Checkbox(
                      checkColor: const Color.fromRGBO(48, 48, 48, 1),
                      activeColor: Colors.green,
                      value: todo.isChecked,
                      onChanged: (newValue) {
                        toggleTodoState(todos.indexOf(todo));
                      },
                    ),
                  ),
                  Text(
                    todo.name,
                    style: TextStyle( 
                      fontSize: 25,
                      color: todo.isChecked ? Colors.grey : Colors.white,
                      decoration: todo.isChecked ? TextDecoration.lineThrough : TextDecoration.none,
                      decorationColor: Colors.red,
                    ),
                  ),
                ],
              ),
          ),

          IconButton(
            icon:Icon(Icons.delete,color: Colors.red,),
            onPressed: () {
              removeTodo(todo);
            },
          ),
        ],
      ),
    );
  }
}