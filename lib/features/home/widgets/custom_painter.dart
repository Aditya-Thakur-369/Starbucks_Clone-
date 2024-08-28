import 'package:flutter/material.dart';

class CurvedGreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF027A48) // Your green color
      ..style = PaintingStyle.fill;

    final Path path = Path()
      ..moveTo(0, size.height * 0.25)
      ..quadraticBezierTo(
        size.width * 0.25,
        size.height * 0.1,
        size.width * 0.5,
        size.height * 0.2,
      )
      ..quadraticBezierTo(
        size.width * 0.75,
        size.height * 0.3,
        size.width,
        size.height * 0.1,
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
