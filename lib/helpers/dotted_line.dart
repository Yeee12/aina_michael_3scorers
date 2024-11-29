import 'package:flutter/material.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 5;
    double dashSpace = 5;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, startY),
        Offset(size.width / 2, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class DottedLine extends StatelessWidget {
  final double height;

  const DottedLine({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        size: Size(1, height),
        painter: DottedLinePainter(),
    );
  }
}