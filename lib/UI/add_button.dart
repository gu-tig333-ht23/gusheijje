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
    return Positioned(
      bottom: 8,
      left: screenSize - 102.5,
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
