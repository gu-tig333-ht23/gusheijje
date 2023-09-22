//The appbar for TodoHome

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/theme_provider.dart';
import '../Components/todo_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final List<String> menuItems = ['all', 'done', 'undone'];

    return AppBar(
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
        icon: context.read<ThemeProvider>().darkMode
            ? Icon(
                Icons.light_mode,
                color: context.read<ThemeProvider>().mainColor,
              )
            : Icon(Icons.dark_mode),
        onPressed: () {
          context.read<ThemeProvider>().toggleDarkMode();
        },
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (String selectedItem) {
            Provider.of<TodoProvider>(context, listen: false).todoFilter =
                selectedItem;
            print(Provider.of<TodoProvider>(context, listen: false).todoFilter);
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
    );
  }
}
