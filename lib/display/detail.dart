import 'package:flutter/material.dart';

class DetailClipper extends CustomClipper<Path> {
  final double radius;

  DetailClipper({@required this.radius});

  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 1.4), radius: radius));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 1.4), radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
