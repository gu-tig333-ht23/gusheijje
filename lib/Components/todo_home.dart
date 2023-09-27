//the main page of the app

//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Components
import 'todo_provider.dart';
import 'todo_list_provider.dart';
import 'theme_provider.dart';
import 'todo.dart';
import 'todo_list_view_builder.dart';

//UI imports
import '../UI/Bottombar/bottombar.dart';
import '../UI/Bottombar/add_button.dart';
import '../UI/home_appbar.dart';
import '../UI/progress_indicator.dart';
import '../UI/Bottombar/todo_help.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().background,
      appBar: HomeAppBar(
        home: true,
      ),
      body: Container(
        color: context.watch<ThemeProvider>().background,
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Consumer<TodoProvider>(
                  builder: (context, todoProvider, child) {
                    return Consumer<TodoListProvider>(
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
                    );
                  },
                ),
                AddButton(context),
                BottomBar(
                  barColor: context.watch<ThemeProvider>().bottomBarBorderColor,
                  cutRadius: 39,
                  height: 61,
                  offSet: 0,
                ),
                BottomBar(
                  barColor: context.watch<ThemeProvider>().bottomBarBorderColor,
                  cutRadius: 38.0,
                  height: 61,
                  offSet: 1,
                ),
                BottomBar(
                  barColor: context.watch<ThemeProvider>().bottomBarColor,
                  cutRadius: 39.0,
                  height: 60,
                  offSet: 0,
                ),
                TodoHelp(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
