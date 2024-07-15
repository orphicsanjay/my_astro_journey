import 'package:flutter/cupertino.dart';

class DashedBottomBorderContainer extends StatelessWidget {
  final double dashLength;
  final double dashSpacing;
  final Color borderColor;
  final double borderWidth;
  final Widget child;

  const DashedBottomBorderContainer({
    super.key,
    required this.dashLength,
    required this.dashSpacing,
    required this.borderColor,
    required this.borderWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DashedBottomBorderPainter(
        dashLength: dashLength,
        dashSpacing: dashSpacing,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
      child: child,
    );
  }
}

class DashedBottomBorderPainter extends CustomPainter {
  final double dashLength;
  final double dashSpacing;
  final Color borderColor;
  final double borderWidth;

  DashedBottomBorderPainter({
    required this.dashLength,
    required this.dashSpacing,
    required this.borderColor,
    required this.borderWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = borderColor
      ..strokeWidth = borderWidth
      ..style = PaintingStyle.stroke;

    double x = 0;
    final y = size.height - borderWidth / 2; // Adjust for the stroke width

    while (x < size.width) {
      canvas.drawLine(
        Offset(x, y),
        Offset(x + dashLength, y),
        paint,
      );
      x += dashLength + dashSpacing;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
