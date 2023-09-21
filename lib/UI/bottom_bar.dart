//i denna filen finns koden för remsan som finns i botten av appen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Components/theme_provider.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = 39.0;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.arcTo(
      Rect.fromCircle(center: Offset(size.width - 60, 0), radius: radius),
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

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: 0,
      child: Container(
        child: Container(
          width: screenWidth,
          height: 50,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              color: context.watch<ThemeProvider>().appBarBgColor,
            ),
          ),
        ),
      ),
    );
  }
}
