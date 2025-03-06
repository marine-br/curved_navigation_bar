import 'package:flutter/material.dart';

class NavCustomPainter extends CustomPainter {
  late double loc;
  late double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo((loc - 0.1) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.45) * size.width, // x
        size.height * 0.05, // y
        loc * size.width, // x
        size.height * 0.55, // y
        (loc + s * 0.50) * size.width, // x
        size.height * 0.60, // y
      )
      ..cubicTo(
        (loc + s) * size.width, // x
        size.height * 0.55, // y
        (loc + s - s * .46) * size.width, // x
        size.height * 0.1, // y
        (loc + s + 0.1) * size.width, // x
        0, // y
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return this != oldDelegate;
  }
}
