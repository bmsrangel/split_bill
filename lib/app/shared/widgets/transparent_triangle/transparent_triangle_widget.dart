import 'package:flutter/material.dart';

class TransparentTriangleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: TransparentRectangle(),
    );
  }
}

class TransparentRectangle extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.style = PaintingStyle.fill;
    paint.color = Colors.white10;

    path
      ..lineTo(0, 0)
      ..lineTo(size.height, size.height)
      ..lineTo(size.height * 2, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
