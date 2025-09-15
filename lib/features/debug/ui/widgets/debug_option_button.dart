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
    return InkWell(
      onTap: onTap?.call,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.grey,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Center(
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
