import 'dart:math' as math show sin, pi, sqrt;

import 'package:flutter/material.dart';

class CircleRippleButton extends StatefulWidget {
  final double size;
  final Color color;
  final Widget? child;

  const CircleRippleButton({super.key, required this.size, required this.color, this.child});

  @override
  State<CircleRippleButton> createState() => _CircleRippleButtonState();
}

class _CircleRippleButtonState extends State<CircleRippleButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget button() {
      return Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.size),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [widget.color, Color.lerp(widget.color, Colors.black, .05)!],
              ),
            ),
            child: ScaleTransition(
              scale: Tween(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(
                  parent: animationController,
                  curve: const CurveWave(),
                ),
              ),
              child: widget.child,
            ),
          ),
        ),
      );
    }

    return Center(
      child: CustomPaint(
        painter: CirclePainter(
          animationController,
          color: widget.color,
        ),
        child: SizedBox(
          width: widget.size * 4.125,
          height: widget.size * 4.125,
          child: button(),
        ),
      ),
    );
  }
}

class CurveWave extends Curve {
  const CurveWave();
  @override
  double transform(double t) {
    if (t == 0 || t == 1) {
      return 0.01;
    }
    return math.sin(t * math.pi);
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final Animation<double> animation;

  CirclePainter(
    this.animation, {
    required this.color,
  });

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color opacityColor = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()..color = opacityColor;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
