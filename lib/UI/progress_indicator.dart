//the screen that appears when the list loads

import 'package:flutter/material.dart';
import '../Components/theme_provider.dart';
import 'package:provider/provider.dart';

class MyProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background color
        Container(
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
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
        ),
      ],
    );
  }
}
