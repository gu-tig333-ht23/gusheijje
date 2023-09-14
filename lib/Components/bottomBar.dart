import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 10;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.arcTo(
      Rect.fromCircle(center: Offset(size.width / 1.15, 0), radius: radius),
      0,
      3.14,
      false,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CutoutRectangleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      width: screenWidth,
      height: 50,
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: context.watch<ThemeProvider>().appBarBgColor,
        ),
      ),
    );
  }
}
