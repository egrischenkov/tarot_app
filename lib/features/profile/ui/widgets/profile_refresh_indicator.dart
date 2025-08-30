import 'dart:ui';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ProfileRefreshIndicator extends StatelessWidget {
  final Widget child;

  const ProfileRefreshIndicator({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    const double indicatorHeight = 70;
    const double appBarHeight = kToolbarHeight + UiKitAppBar.height;

    return CustomRefreshIndicator(
      onRefresh: _onRefresh,
      builder: (context, child, controller) {
        // Pull value for animation
        final double pullValue = controller.isLoading ? 1.0 : controller.value.clamp(0.0, 1.0);

        // Top offset for the indicator: slides out from under the AppBar
        final double topOffset = appBarHeight - indicatorHeight + indicatorHeight * pullValue;

        // List offset: moves down by the indicator height while loading
        final double listOffset = controller.isLoading ? indicatorHeight : indicatorHeight * pullValue;

        // Scale and opacity for the indicator
        final double indicatorScale = lerpDouble(0.5, 1.0, pullValue)!;
        final double indicatorOpacity = pullValue;

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            // The scrollable list, moved down during loading
            Transform.translate(
              offset: Offset(0, listOffset),
              child: child,
            ),

            // Lottie indicator
            Positioned(
              top: topOffset,
              left: 0,
              right: 0,
              child: Center(
                child: SizedBox(
                  height: indicatorHeight,
                  width: indicatorHeight,
                  child: Transform.scale(
                    scale: indicatorScale,
                    child: Opacity(
                      opacity: indicatorOpacity,
                      child: Lottie.asset(
                        Assets.lottie.sandyLoading,
                        animate: controller.isLoading,
                        repeat: true,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: child,
    );
  }

  Future<void> _onRefresh() async {
    // Simulate a refresh delay
    await Future.delayed(const Duration(seconds: 2));
  }
}
