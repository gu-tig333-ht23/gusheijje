
import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:provider/provider.dart';

Widget todoItem(context,Todo todo) {
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
            removeTodo(context, todo);
          },
        ),
      ],
    ),
  );
}