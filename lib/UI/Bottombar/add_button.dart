//the addbutton

import 'package:flutter/material.dart';
import '../../Components/theme_provider.dart';
import 'package:provider/provider.dart';
import '../../Components/add_todo_page.dart';

class AddButton extends StatelessWidget {
  final BuildContext context;

  AddButton(this.context);

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.width;
    const double myIconSize = 75;
    return Stack(
      children: [
        Positioned(
          bottom: 22,
          left: screenSize - 98.5,
          child: Icon(
            Icons.add_circle,
            size: myIconSize + 3,
            color: context.watch<ThemeProvider>().bottomBarBorderColor,
          ),
        ),
        Positioned(
          bottom: 23.5,
          left: screenSize - 97,
          child: IconButton(
            alignment: Alignment.center,
            iconSize: myIconSize,
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
