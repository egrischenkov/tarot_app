import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class DebugOptionButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final bool isLoading;

  const DebugOptionButton({
    required this.title,
    this.backgroundColor,
    this.onTap,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.grey,
      ),
      child: InkWell(
        onTap: onTap?.call,
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            vertical: UiKitSpacing.x3,
            horizontal: UiKitSpacing.x4,
          ),
          child: isLoading
              ? const CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(
                    color: context.colors.background,
                  ),
                ),
        ),
      ),
    );
  }
}
