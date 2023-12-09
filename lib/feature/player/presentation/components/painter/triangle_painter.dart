import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  const TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final path = Path()
      ..moveTo((width / 2) - 8, 20)
      ..arcToPoint(
        Offset((width / 2) + 8, 20),
        radius: Radius.circular(4),
        clockwise: true,
      )
      ..lineTo(width, height)
      ..lineTo(0, height)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}