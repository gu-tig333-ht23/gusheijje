import 'package:flutter/material.dart';
import '../Components/todo.dart';
import '../pages/add.dart';
import 'package:provider/provider.dart';
import '../Components/todoItem.dart';


class TodoHome extends StatefulWidget {
  @override
  _TodoHomeState createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> { 

  String todoFilter = 'all';

  List<Todo> filteredTodos() {
    final todoNotifier = Provider.of<TodoNotifier>(context);

    if (todoFilter == 'done') {
      return todoNotifier.todos.where((todo) => todo.isChecked).toList();
    } else if (todoFilter == 'undone') {
      return todoNotifier.todos.where((todo) => !todo.isChecked).toList();
    } else {
      // Default: show all todos
      return todoNotifier.todos;
    }
  }

  void addTodoWithContext(String name) {
  add(context, name);
  }

  void _navigateToadd(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTodoPage(addTodoWithContext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final todoNotifier = Provider.of<TodoNotifier>(context, listen: true);

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
                setState(() {
                  todoFilter = selectedItem;
                });
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
              children: filteredTodos().map((todo) => todoItem(context, todo)).toList(),
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

  
}

