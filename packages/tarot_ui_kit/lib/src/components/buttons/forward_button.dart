import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitForwardButton extends StatelessWidget {
  final VoidCallback? onTap;

  const UiKitForwardButton({
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Container(
        padding: const EdgeInsets.all(UiKitSpacing.base),
        decoration: BoxDecoration(
          color: colors.iconBackground,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_forward_ios,
          size: UiKitSize.x4,
          color: colors.iconColor,
        ),
      ),
    );
  }
}
