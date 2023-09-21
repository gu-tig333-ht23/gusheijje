import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/theme_provider.dart';
import '../Components/todo_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.menuItems,
  });

  final List<String> menuItems;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
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
