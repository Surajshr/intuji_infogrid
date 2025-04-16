import 'dart:math' as math;

import 'package:intuji_infogrid/core/imports/ui_imports.dart';

class GaugePainter extends CustomPainter {
  final double value;
  final Color inactiveColor;

  GaugePainter({required this.value, this.inactiveColor = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    final strokeWidth = 16.r;

    // Define consistent shadow parameters for equal spread
    final shadowExtraWidth = 8.0;

    // Add sharp shadow paint with gray color
    final shadowPaint =
        Paint()
          ..color = AppColor.kGaugeShadowColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth + shadowExtraWidth
          ..strokeCap = StrokeCap.round;

    // Draw shadow arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      shadowPaint,
    );

    // Define paint for the gauge background with white color
    final bgPaint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    // Draw the background arc (180 degrees)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      math.pi,
      false,
      bgPaint,
    );

    // Create gradient for active arc
    final gradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: AppColor.kGaugeInactiveColor,
      stops: const [0.2, 0.7, 1.0],
    );

    // Paint for the start of active arc (rounded)
    final activeStartPaint =
        Paint()
          ..shader = gradient.createShader(
            Rect.fromCircle(center: center, radius: radius),
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round;

    // Paint for the end of active arc (sharp)
    final activeEndPaint =
        Paint()
          ..shader = gradient.createShader(
            Rect.fromCircle(center: center, radius: radius),
          )
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.butt;

    // Draw the start point of active arc with round cap
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi,
      0.01, // Very small angle for the rounded start
      false,
      activeStartPaint,
    );

    // Draw the main active arc with sharp end
    if (value > 0.01) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        math.pi,
        (value * math.pi),
        false,
        activeEndPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class GaugeMeter extends StatelessWidget {
  final double value;
  final String amount;
  final String label;
  final double width;
  final double height;

  const GaugeMeter({
    Key? key,
    required this.value,
    required this.amount,
    required this.label,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: Stack(
        children: [
          CustomPaint(
            size: Size(width, height * 0.5),
            painter: GaugePainter(
              value: value,
              inactiveColor: Colors.grey.shade300,
            ),
          ),

          Positioned(
            top: 15.h,
            left: 0,
            right: 0,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                BuildText(
                  text: amount,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w800,
                ),
                2.verticalSpace,
                BuildText(
                  text: label,
                  fontSize: 12.sp,
                  height: 16.sp / 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.kTextDisabledColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
