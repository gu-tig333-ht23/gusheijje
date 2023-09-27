//the main page of the app

//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Components
import '../Components/todo.dart';
import '../Components/todo_list_view_builder.dart';

//Providers
import '../Providers/todo_filter_provider.dart';
import '../Providers/todo_list_provider.dart';
import '../Providers/theme_provider.dart';

//UI imports
import '../UI/Bottombar/bottombar.dart';
import '../UI/Bottombar/add_button.dart';
import '../UI/appbar.dart';
import '../UI/progress_indicator.dart';
import '../UI/Bottombar/Bottombar_buttons.dart';

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
                Consumer<TodoFilterProvider>(
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
                BottumBarButtons(),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
