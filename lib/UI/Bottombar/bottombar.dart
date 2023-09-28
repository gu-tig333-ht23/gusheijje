//in this file is the code for bar which is at the bottom of the app
import 'package:flutter/material.dart';

class CustomShapeClipper extends CustomClipper<Path> {
  final double cutRadius;
  final double offSet;

  CustomShapeClipper({
    required this.cutRadius,
    required this.offSet,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    final radius = cutRadius;

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    path.arcTo(
      Rect.fromCircle(center: Offset(size.width - 60, offSet), radius: radius),
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
  final Color barColor;
  final double bottomPos = 0.0;
  final double cutRadius;
  final double height;
  final double offSet;

  BottomBar({
    required this.barColor,
    required this.cutRadius,
    required this.height,
    required this.offSet,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      bottom: bottomPos,
      child: Container(
        child: Container(
          width: screenWidth,
          height: height,
          child: ClipPath(
            clipper: CustomShapeClipper(
              cutRadius: cutRadius,
              offSet: offSet,
            ),
            child: Container(
              color: barColor,
            ),
          ),
        ),
      ),
    );
  }
}
