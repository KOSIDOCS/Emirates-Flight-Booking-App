import 'package:flutter/material.dart';

class PlaneCurved extends CustomPainter {
  final Color bodyColor;
  final double width;
  PlaneCurved({@required this.bodyColor, @required this.width});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = bodyColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = width;

    var startPoint = Offset(0, size.height / 2);
    var controlPoint1 = Offset(size.width / 4, size.height / 5);
    var controlPoint2 = Offset(3 * size.width / 4, size.height / 5);
    var endPoint = Offset(size.width, size.height / 2);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint1.dx, controlPoint1.dy - 20, controlPoint2.dx,
        controlPoint2.dy - 20, endPoint.dx, endPoint.dy + 1);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
