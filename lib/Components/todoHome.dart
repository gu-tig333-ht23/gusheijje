import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'todo.dart';
import 'AddTodoPage.dart';
import 'TodoProvider.dart';
import 'todoListProvider.dart';
import 'ThemeProvider.dart';
import 'bottomBar.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<AnimatedListState> _key = context.watch<TodoListProvider>().key;

    void _addItem(String name) {
      Provider.of<TodoListProvider>(context, listen: false).addItem(name);
    }

    void _removeItem(int index) {
      Provider.of<TodoListProvider>(context, listen: false).removeItem(index);
    }

    void _toggleTodoCompletion(int index) {
      Provider.of<TodoListProvider>(context, listen: false)
          .toggleTodoCompletion(index);
    }

    final _items = context.watch<TodoListProvider>().items;
    final List<String> menuItems = ['all', 'done', 'undone'];
    String todoFilter = 'all';

    return Scaffold(
      backgroundColor: context.watch<ThemeProvider>().background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: context.watch<ThemeProvider>().appBarBgColor,
        flexibleSpace: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0),
            child: Text(
              'TIG333 TODO',
              style: TextStyle(
                color: context.watch<ThemeProvider>().appBarTxColor,
                fontSize: 25,
              ),
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.light_mode),
          onPressed: () {
            context.read<ThemeProvider>().toggleDarkMode();
          },
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String selectedItem) {
              Provider.of<TodoProvider>(context, listen: false).todoFilter =
                  selectedItem;
              print(
                  Provider.of<TodoProvider>(context, listen: false).todoFilter);
            },
            itemBuilder: (BuildContext context) {
              return menuItems.map((String item) {
                return PopupMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList();
            },
            icon: Icon(
              Icons.more_vert,
              color: context.watch<ThemeProvider>().appBarTxColor,
            ),
          ),
        ],
      ),
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
                      child: AnimatedList(
                        key: _key,
                        initialItemCount: _items.length,
                        padding: const EdgeInsets.all(10),
                        itemBuilder: (context, index, animation) {
                          String todoFilterA =
                              Provider.of<TodoProvider>(context, listen: false)
                                  .todoFilter;
                          if ((todoFilterA == 'done' &&
                                  !_items[index].isChecked) ||
                              (todoFilterA == 'undone' &&
                                  _items[index].isChecked)) {
                            return SizedBox.shrink();
                          }

                          return SizeTransition(
                            key: UniqueKey(),
                            sizeFactor: animation,
                            child: Card(
                              margin: const EdgeInsets.all(10),
                              color:
                                  context.watch<ThemeProvider>().todoTileColor,
                              child: Dismissible(
                                  key: UniqueKey(),
                                  onDismissed: (direction) {
                                    if (direction ==
                                        DismissDirection.startToEnd) {
                                      _removeItem(index);
                                    } else if (direction ==
                                        DismissDirection.endToStart) {
                                      _toggleTodoCompletion(index);
                                    }
                                  },
                                  child: ListTile(
                                    leading: Checkbox(
                                      checkColor:
                                          const Color.fromARGB(255, 30, 30, 30),
                                      activeColor:
                                          Color.fromRGBO(0, 128, 0, 1.0),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => BorderSide(
                                            width: 1.0,
                                            color: context
                                                .watch<ThemeProvider>()
                                                .checkBoxBorderColor),
                                      ),
                                      value: _items[index].isChecked,
                                      onChanged: (bool) {
                                        _toggleTodoCompletion(index);
                                      },
                                    ),
                                    title: Text(
                                      _items[index].name,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: _items[index].isChecked
                                            ? Color.fromARGB(155, 193, 192, 192)
                                            : context
                                                .watch<ThemeProvider>()
                                                .todoTileTxColor,
                                        decoration: _items[index].isChecked
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
                                        _removeItem(index);
                                      },
                                    ),
                                  )),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
                Positioned(
                  bottom: 8,
                  right: 11,
                  child: IconButton(
                    alignment: Alignment.center,
                    iconSize: 85,
                    padding: EdgeInsets.all(0),
                    icon: Icon(
                      Icons.add_circle,
                      color: context.watch<ThemeProvider>().iconAdd,
                    ),
                    onPressed: () {
                      _navigateToadd(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    child: CutoutRectangleWidget(),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }

  void _navigateToadd(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddTodoPage(),
      ),
    );
  }
}
