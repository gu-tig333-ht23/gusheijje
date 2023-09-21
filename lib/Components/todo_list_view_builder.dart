import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import 'todo_provider.dart';
import 'todo_list_provider.dart';
import 'theme_provider.dart';

class TodoListViewBuilder extends StatelessWidget {
  const TodoListViewBuilder({
    super.key,
    required this.items,
  });

  final List<Todo>? items;

  @override
  Widget build(BuildContext context) {
    final itemsLenght = items?.length ?? 0;

    return ListView.builder(
      itemCount: itemsLenght,
      padding: const EdgeInsets.all(10),
      itemBuilder: (context, index) {
        String todoFilterA =
            Provider.of<TodoProvider>(context, listen: false).todoFilter;

        if (items == null || index >= itemsLenght) {
          return SizedBox.shrink();
        }

        final Todo todoItem = items?[index] ??
            Todo(
              title: 'error',
              id: '0',
              done: false,
            );

        if ((todoFilterA == 'done' && !todoItem.done) ||
            (todoFilterA == 'undone' && todoItem.done)) {
          return SizedBox.shrink();
        }

        return Card(
          margin: const EdgeInsets.all(10),
          color: context.watch<ThemeProvider>().todoTileColor,
          child: Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .removeItem(todoItem.id);
              } else if (direction == DismissDirection.endToStart) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .toggleTodoCompletion(todoItem);
              }
            },
            child: ListTile(
              leading: Checkbox(
                checkColor: const Color.fromARGB(255, 30, 30, 30),
                activeColor: Color.fromRGBO(0, 128, 0, 1.0),
                side: MaterialStateBorderSide.resolveWith(
                  (states) => BorderSide(
                      width: 1.0,
                      color:
                          context.watch<ThemeProvider>().checkBoxBorderColor),
                ),
                value: todoItem.done,
                onChanged: (bool) {
                  context
                      .read<TodoListProvider>()
                      .toggleTodoCompletion(todoItem);
                },
              ),
              title: Text(
                todoItem.title,
                style: TextStyle(
                  fontSize: 24,
                  color: todoItem.done
                      ? Color.fromARGB(155, 193, 192, 192)
                      : context.watch<ThemeProvider>().todoTileTxColor,
                  decoration: todoItem.done
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationColor: Colors.red,
                  decorationThickness: 2.85,
                ),
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Color.fromRGBO(255, 61, 61, 1.0),
                ),
                onPressed: () {
                  Provider.of<TodoListProvider>(context, listen: false)
                      .removeItem(todoItem.id);
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
