import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = size.width / 10;

    // Draw the rectangle
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    // Draw the top half-circle cutout
    path.arcTo(
      Rect.fromCircle(center: Offset(size.width / 1.15, 0), radius: radius),
      0,
      3.14, // 180 degrees
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
      width: screenWidth, // You can adjust this width as needed
      height: 50, // Specify the height
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          color: context.watch<ThemeProvider>().appBarBgColor,
        ),
      ),
    );
  }
}
