//huvudsidan för appen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo_provider.dart';
import 'todo_list_provider.dart';
import 'theme_provider.dart';
import './todo.dart';
import 'todo_list_view_builder.dart';

//UI imports
import '../UI/bottom_bar.dart';
import '../UI/add_button.dart';
import '../UI/home_appbar.dart';
import '../UI/progress_indicator.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = ['all', 'done', 'undone'];

    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().background,
      appBar: HomeAppBar(menuItems: menuItems),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              context.watch<ThemeProvider>().background,
              context.watch<ThemeProvider>().backgroundTwo,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Consumer<TodoProvider>(
                  builder: (context, todoProvider, child) {
                    print(Provider.of<TodoProvider>(context, listen: false)
                        .todoFilter);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 50.0),
                      child: Consumer<TodoListProvider>(
                        builder: (context, todoListProvider, child) {
                          return FutureBuilder<List<Todo>>(
                            future: context.watch<TodoListProvider>().items,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return MyProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final items = snapshot.data;

                                return TodoListViewBuilder(items: items);
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                AddButton(context),
                BottomBar(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
