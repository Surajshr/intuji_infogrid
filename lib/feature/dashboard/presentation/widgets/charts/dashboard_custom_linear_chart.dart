import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class DashboardCustomLinearChart extends StatelessWidget {
  final List<double> dataPoints;
  final List<Color> gradientColors;
  final double strokeWidth;
  final double shadowOffset;
  final double shadowOpacity;

  const DashboardCustomLinearChart({
    super.key,
    required this.dataPoints,
    this.gradientColors = const [], // Default empty list
    this.strokeWidth = 3.0,
    this.shadowOffset = 10.0,
    this.shadowOpacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 18, top: 10, bottom: 4),
        child: CustomPaint(
          painter: LineChartPainter(
            dataPoints: dataPoints,
            gradientColors:
                gradientColors.isEmpty
                    ? AppColor.kGradientColors2
                    : gradientColors,
            strokeWidth: strokeWidth,
            shadowOffset: shadowOffset,
            shadowOpacity: shadowOpacity,
          ),
        ),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> dataPoints;
  final List<Color> gradientColors;
  final double strokeWidth;
  final double shadowOffset;
  final double shadowOpacity;

  LineChartPainter({
    required this.dataPoints,
    required this.gradientColors,
    required this.strokeWidth,
    required this.shadowOffset,
    required this.shadowOpacity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;

    // Convert data points to chart points
    final points = List<Offset>.generate(
      dataPoints.length,
      (i) => Offset(width * (i / (dataPoints.length - 1)), dataPoints[i]),
    );

    // Add padding points for smooth edges
    points.insert(0, Offset(-width * 0.05, points.first.dy));
    points.add(Offset(width * 1.05, points.last.dy));

    // Convert normalized points to actual coordinates
    final actualPoints =
        points
            .map((point) => Offset(point.dx, height - (point.dy * height)))
            .toList();

    // Create path for the line
    final linePath = Path();
    linePath.moveTo(actualPoints[1].dx, actualPoints[1].dy);

    // Create a smoother curve through the points with reduced roundness
    for (int i = 1; i < actualPoints.length - 2; i++) {
      final current = actualPoints[i];
      final next = actualPoints[i + 1];

      // Adjust control points to be closer to the points for less roundness
      final controlPoint1 = Offset(
        current.dx + (next.dx - current.dx) * 0.2, // Reduced from 0.5 to 0.2
        current.dy,
      );
      final controlPoint2 = Offset(
        current.dx + (next.dx - current.dx) * 0.8, // Increased from 0.5 to 0.8
        next.dy,
      );

      linePath.cubicTo(
        controlPoint1.dx,
        controlPoint1.dy,
        controlPoint2.dx,
        controlPoint2.dy,
        next.dx,
        next.dy,
      );
    }

    // Create path for the shadow
    final shadowPath = Path.from(linePath);

    // Add points for the bottom part of the shadow
    for (int i = actualPoints.length - 2; i > 0; i--) {
      final point = actualPoints[i];
      shadowPath.lineTo(point.dx, point.dy + shadowOffset);
    }
    shadowPath.close();

    // Define gradients
    final lineGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: gradientColors,
    ).createShader(Rect.fromLTWH(0, 0, width, height));

    final shadowGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors:
          gradientColors
              .map((color) => color.withOpacity(shadowOpacity))
              .toList(),
    ).createShader(Rect.fromLTWH(0, 0, width, height));

    // Draw shadow first
    canvas.drawPath(
      shadowPath,
      Paint()
        ..shader = shadowGradient
        ..style = PaintingStyle.fill
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3),
    );

    // Draw line
    canvas.drawPath(
      linePath,
      Paint()
        ..shader = lineGradient
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
