//shows instructions on how to use the app

import 'package:flutter/material.dart';
import '../../Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class BottumBarButtons extends StatelessWidget {
  const BottumBarButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Help'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.swipe_left,
                              size: 48,
                            ),
                            Icon(
                              Icons.done,
                              color: Colors.green,
                              size: 48,
                            ),
                          ],
                        ),
                        Text('Swipe left to complete task'),
                        Text(''),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 48,
                            ),
                            Icon(
                              Icons.swipe_right,
                              size: 48,
                            ),
                          ],
                        ),
                        Text('Swipe right to remove task')
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.help,
              color: context.watch<ThemeProvider>().BottomBarIconColor,
            ),
          ),
          IconButton(
            icon: context.watch<ThemeProvider>().darkMode
                ? Icon(
                    Icons.light_mode,
                    color: context.watch<ThemeProvider>().BottomBarIconColor,
                  )
                : Icon(Icons.dark_mode,
                    color: context.watch<ThemeProvider>().BottomBarIconColor),
            onPressed: () {
              context.read<ThemeProvider>().toggleDarkMode();
            },
          ),
        ],
      ),
    );
  }
}
