
import 'package:flutter/material.dart';
import 'todo.dart';
import 'package:provider/provider.dart';

Widget todoItem(context,Todo todo) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        color:const Color.fromARGB(150, 41, 41, 41),
        border: Border.all(
              color: Colors.grey,
              width: 1.0,
          ),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                      activeColor: Color.fromRGBO(255, 152, 0, 1),
                      value: todo.isChecked,
                      onChanged: (newValue) {
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
                      decorationColor: Colors.orange,
                    ),
                  ),
                ],
              ),
          ),
  
          IconButton(
            icon:Icon(Icons.delete,color: Colors.red,),
            onPressed: () {
              removeTodo(context, todo);
            },
          ),
        ],
      ),
    ),
  );
}