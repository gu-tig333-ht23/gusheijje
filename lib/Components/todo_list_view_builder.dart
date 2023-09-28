//This is the file that generates the todo list

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import '../Providers/todo_filter_provider.dart';
import '../Providers/todo_list_provider.dart';
import '../Providers/theme_provider.dart';

class TodoListViewBuilder extends StatelessWidget {
  const TodoListViewBuilder({
    super.key,
    required this.items,
  });

  final List<Todo>? items;

  @override
  Widget build(BuildContext context) {
    final itemsLenght = items?.length ?? 0;

    Future<void> updateList() async {
      await context.read<TodoListProvider>().getList();
    }

    return RefreshIndicator(
      onRefresh: () => updateList(),
      child: ListView.builder(
        itemCount: itemsLenght + 1,
        padding: const EdgeInsets.all(10),
        itemBuilder: (context, index) {
          if (index == itemsLenght) {
            //This is so that the bottombar doesn't hide the last todo
            return SizedBox(
              height: 85,
            );
          }

          String todoFilterA =
              Provider.of<TodoFilterProvider>(context, listen: false)
                  .todoFilter;

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

          return Dismissible(
            key: UniqueKey(),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                Provider.of<TodoListProvider>(context, listen: false)
                    .removeItem(todoItem.id);
              }
            },
            background: Card(
              margin: const EdgeInsets.all(5),
              color: context.watch<ThemeProvider>().todoTileColor,
              child: Container(
                color: Colors.red,
                child: Icon(Icons.delete, size: 48.0),
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(right: 16.0),
              ),
            ),
            secondaryBackground: Card(
              margin: const EdgeInsets.all(5),
              color: context.watch<ThemeProvider>().todoTileColor,
              child: Container(
                color: Colors.green,
                child: Icon(
                  Icons.done,
                  size: 48.0,
                  color: todoItem.done ? Colors.red : Colors.white,
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(left: 16.0),
              ),
            ),
            confirmDismiss: (DismissDirection direction) async {
              if (direction == DismissDirection.startToEnd) {
                return true;
              } else {
                Provider.of<TodoListProvider>(context, listen: false)
                    .toggleTodoCompletion(todoItem);
                return false;
              }
            },
            child: Card(
              margin: const EdgeInsets.all(5),
              color: context.watch<ThemeProvider>().todoTileColor,
              child: ListTile(
                leading: todoItem.done
                    ? Icon(
                        Icons.done,
                        color: Colors.green,
                        size: 28.0,
                      )
                    : Icon(
                        Icons.done,
                        color: context.watch<ThemeProvider>().todoTileColor,
                      ),
                title: Text(
                  todoItem.title,
                  style: TextStyle(
                    fontSize: 20,
                    color: todoItem.done
                        ? context.watch<ThemeProvider>().todoTileTxColorDone
                        : context.watch<ThemeProvider>().todoTileTxColor,
                    decoration: todoItem.done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.red,
                    decorationThickness: 2.85,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
