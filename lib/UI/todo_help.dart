//shows instructions on how to use the app

import 'package:flutter/material.dart';
import '../Components/theme_provider.dart';
import 'package:provider/provider.dart';

class TodoHelp extends StatelessWidget {
  const TodoHelp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 5,
      child: IconButton(
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
          color: context.read<ThemeProvider>().mainColor,
        ),
      ),
    );
  }
}
