import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitBottomSheetValueItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Widget? trailing;
  final VoidCallback? onTap;

  const UiKitBottomSheetValueItem({
    required this.label,
    required this.isSelected,
    this.trailing,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    final localTrailing = trailing;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: UiKitSize.x6,
        color: colors.background,
        child: Row(
          children: [
            if (localTrailing != null) ...[
              SizedBox(
                height: UiKitSize.x6,
                width: UiKitSize.x6,
                child: localTrailing,
              ),
              UiKitSpacing.x4.w,
            ],
            Text(label, style: fonts.bodyRegular),
            const Spacer(),
            if (isSelected)
              Icon(
                Icons.check_circle,
                color: colors.accent,
                size: UiKitSize.x6,
              ),
          ],
        ),
      ),
    );
  }
}
