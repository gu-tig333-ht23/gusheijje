import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../Components/todo.dart';
import '../pages/add.dart';
import 'package:provider/provider.dart';


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


  void add(String name) {
  final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
  todoNotifier.addTodo(name);
  }

  void removeTodo(Todo todo) {
  final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
  todoNotifier.removeTodo(todo);
  }

  void toggleTodoState(Todo todo) {
  final todoNotifier = Provider.of<TodoNotifier>(context, listen: false);
  todoNotifier.toggleTodo(todo);
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
              children: filteredTodos().map((todo) => _todoItem(todo)).toList(),
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
                        print("Checkbox onChanged called");
                        Provider.of<TodoNotifier>(context, listen: false).toggleTodo(todo);
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
              print("Remove button pressed");
              removeTodo(todo);
            },
          ),
        ],
      ),
    );
  }
}

