part of '../screens/profile_screen.dart';

class ProfileRefreshIndicator extends StatefulWidget {
  final AsyncCallback onRefresh;
  final Widget child;

  const ProfileRefreshIndicator({
    required this.onRefresh,
    required this.child,
    super.key,
  });

  @override
  State<ProfileRefreshIndicator> createState() => _ProfileRefreshIndicatorState();
}

class _ProfileRefreshIndicatorState extends State<ProfileRefreshIndicator> {
  @override
  Widget build(BuildContext context) {
    const double indicatorHeight = 70;
    const double appBarHeight = kToolbarHeight + UiKitAppBar.height;

    return CustomRefreshIndicator(
      onRefresh: widget.onRefresh,
      builder: (context, child, controller) {
        // Pull value for animation
        final double pullValue = controller.isLoading ? 1.0 : controller.value.clamp(0.0, 1.0);

        // Top offset for the indicator: slides out from under the AppBar
        final double topOffset = appBarHeight - indicatorHeight + indicatorHeight * pullValue;

        // List offset: moves down by the indicator height while loading
        final double listOffset = controller.isLoading ? indicatorHeight : indicatorHeight * pullValue;

        // Scale and opacity for the indicator
        final double? indicatorScale = lerpDouble(0.5, 1.0, pullValue);
        final double indicatorOpacity = pullValue;

        _triggerHaptic(controller);

        return Stack(
          alignment: Alignment.topCenter,
          children: [
            // The scrollable list, moved down during loading
            IgnorePointer(
              ignoring: controller.isLoading,
              child: Transform.translate(
                offset: Offset(0, listOffset),
                child: child,
              ),
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
      child: widget.child,
    );
  }

  DateTime? _lastHapticTime;

  void _triggerHaptic(IndicatorController controller) {
    // Trigger haptic feedback only when dragging
    if (controller.isDragging) {
      final now = DateTime.now();
      // Allow one vibration every 150ms
      if (_lastHapticTime == null || now.difference(_lastHapticTime!) > const Duration(milliseconds: 50)) {
        HapticFeedback.lightImpact();
        _lastHapticTime = now;
      }
    }
  }
}
