import 'package:flutter/material.dart';

class CustomThumbShape extends SliderComponentShape {
  final double thumbWidth;
  final double thumbHeight;

  CustomThumbShape({this.thumbWidth = 5, this.thumbHeight = 10});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(this.thumbWidth, this.thumbHeight);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    Canvas canvas = context.canvas;
    final fillPaint = Paint()
      ..color = sliderTheme.activeTrackColor
      ..style = PaintingStyle.fill;
    final rect = Rect.fromCenter(
        center: center, height: this.thumbHeight, width: this.thumbWidth);
    final rRect = RRect.fromRectAndRadius(rect, Radius.circular(10));
    canvas.drawRRect(rRect, fillPaint);
  }
}
