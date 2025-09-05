import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBottomSheetWrapper extends StatelessWidget {
  final Widget body;
  final bool isExpanded;

  const UiKitBottomSheetWrapper({
    required this.body,
    this.isExpanded = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x4),
      margin: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x2),
      decoration: BoxDecoration(
        color: colors.whiteBgWhite,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(UiKitRadius.x4),
          topRight: Radius.circular(UiKitRadius.x4),
        ),
      ),
      child: Column(
        mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
        children: [
          UiKitSpacing.x2.h,
          Container(
            height: UiKitSize.base,
            width: UiKitSize.x9,
            decoration: BoxDecoration(
              color: context.colors.whiteBgSecondary,
              borderRadius: const BorderRadius.all(Radius.circular(UiKitRadius.x4)),
            ),
          ),
          UiKitSpacing.x8.h,
          body,
          UiKitSpacing.x6.h,
        ],
      ),
    );
  }
}
