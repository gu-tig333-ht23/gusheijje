//the addbutton

import 'package:flutter/material.dart';
import '../Components/theme_provider.dart';
import 'package:provider/provider.dart';
import '../Components/add_todo_page.dart';

class AddButton extends StatelessWidget {
  final BuildContext context;

  AddButton(this.context);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          bottom: 9.5,
          left: screenSize - 101.5,
          child: Icon(
            Icons.add_circle,
            size: 83,
            color: context.watch<ThemeProvider>().bottomBarBorderColor,
          ),
        ),
        Positioned(
          bottom: 11,
          left: screenSize - 100,
          child: IconButton(
            alignment: Alignment.center,
            iconSize: 80,
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
      ],
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
