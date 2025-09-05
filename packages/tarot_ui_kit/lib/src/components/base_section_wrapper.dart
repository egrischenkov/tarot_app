import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBaseSectionWrapper extends StatelessWidget {
  final Widget child;
  const UiKitBaseSectionWrapper({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(UiKitSpacing.x4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiKitSpacing.x4),
        color: context.colors.whiteBgWhite,
      ),
      child: child,
    );
  }
}
