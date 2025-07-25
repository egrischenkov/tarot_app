import 'package:flutter/animation.dart';

class HomeScreenAnimations {
  final AnimationController controller;

  late final Animation<double> moveToCenter;
  late final Animation<double> shiftCards;
  late final Animation<double> expand;
  late final Animation<double> returnBack;
  late final Animation<double> resizeBack;
  late final Animation<double> rotation;

  HomeScreenAnimations({required TickerProvider vsync})
      : controller = AnimationController(
          vsync: vsync,
          duration: const Duration(milliseconds: 650),
        ) {
    moveToCenter = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, .5, curve: Curves.easeIn),
      ),
    );

    shiftCards = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.15, 0.7, curve: Curves.easeInOut),
      ),
    );

    expand = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.55, 1, curve: Curves.easeIn),
      ),
    );

    returnBack = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25, 0.85, curve: Curves.easeIn),
      ),
    );

    resizeBack = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
      ),
    );

    rotation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1, 0.8, curve: Curves.easeIn),
      ),
    );
  }

  void dispose() => controller.dispose();
}
