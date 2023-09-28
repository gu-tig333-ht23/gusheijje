//The appbar for TodoHome

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/theme_provider.dart';
import '../Providers/todo_filter_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  final bool home;

  HomeAppBar({
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: context.watch<ThemeProvider>().appBarBgColor,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: context.watch<ThemeProvider>().bottomBarBorderColor,
              width: 1.0,
            ),
          ),
        ),
        child: Align(
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
      ),
      leading: appBarButtonSwitch(home: home),
    );
  }
}

class appBarButtonSwitch extends StatelessWidget {
  final bool home;
  final List<String> menuItems = ['all', 'done', 'undone'];

  appBarButtonSwitch({
    required this.home,
  });

  @override
  Widget build(BuildContext context) {
    if (home) {
      return PopupMenuButton<String>(
        onSelected: (String selectedItem) {
          Provider.of<TodoFilterProvider>(context, listen: false).todoFilter =
              selectedItem;
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
      );
    } else {
      return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: context.watch<ThemeProvider>().mainColor,
        ),
      );
    }
  }
}
