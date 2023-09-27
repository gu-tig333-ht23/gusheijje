//the screen that appears when the list loads

import 'package:flutter/material.dart';
import '../Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background color
        Container(
          color: context.watch<ThemeProvider>().background,
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                  color: context.watch<ThemeProvider>().todoTileColor),
            ],
          ),
        ),
      ],
    );
  }
}
