import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitPageIndicator extends StatelessWidget {
  final int count;
  final int selectedIndex;

  const UiKitPageIndicator({
    required this.count,
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: intersperse(
        6.w,
        List.generate(count, (index) {
          return _IndicatorDot(isSelected: index == selectedIndex);
        }),
      ).toList(),
    );
  }
}

class _IndicatorDot extends StatefulWidget {
  final bool isSelected;

  const _IndicatorDot({
    required this.isSelected,
  });

  @override
  State<_IndicatorDot> createState() => _IndicatorDotState();
}

class _IndicatorDotState extends State<_IndicatorDot> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    if (widget.isSelected) {
      _controller.value = 1.0;
    }
  }

  @override
  void didUpdateWidget(_IndicatorDot oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isSelected != widget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) => CustomPaint(
        painter: _StarCirclePainter(
          progress: _controller.value,
          colors: colors,
        ),
        size: const Size(16, 16),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _StarCirclePainter extends CustomPainter {
  final double progress; // 0.0 = circle, 1.0 = star
  final UiKitColors colors;

  _StarCirclePainter({
    required this.progress,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Color.lerp(
        colors.yellow,
        colors.deepOrange,
        progress,
      )!
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);

    const circleRadius = 5.0;

    const starOuter = 8.0;
    const starInner = 3.0;

    if (progress == 0.0) {
      canvas.drawCircle(center, circleRadius, paint);
      return;
    }

    final double outerRadius = lerpDouble(circleRadius, starOuter, progress) ?? 0;
    final double innerRadius = lerpDouble(circleRadius, starInner, progress) ?? 0;

    final Path path = Path();
    const int points = 8;

    for (int i = 0; i < points * 2; i++) {
      final angle = pi / points * i;
      final radius = i.isEven ? outerRadius : innerRadius;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _StarCirclePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }

  double? lerpDouble(double a, double b, double t) {
    return a + (b - a) * t;
  }
}
