import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitNextButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;

  const UiKitNextButton({
    this.onTap,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(UiKitSpacing.base),
        decoration: BoxDecoration(
          color: backgroundColor ?? colors.whiteBgSecondary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: UiKitSize.x3,
        ),
      ),
    );
  }
}
