import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBackButton extends StatelessWidget {
  final VoidCallback? onTap;

  const UiKitBackButton({this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(UiKitSpacing.base),
        decoration: BoxDecoration(
          color: colors.whiteBgSecondary,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          size: UiKitSize.x4,
        ),
      ),
    );
  }
}
