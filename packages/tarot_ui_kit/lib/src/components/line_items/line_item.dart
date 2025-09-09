import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitLineItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final String? valueLabel;

  const UiKitLineItem({
    required this.label,
    required this.onTap,
    this.valueLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    final localValueLabel = valueLabel;

    return GestureDetector(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.whiteBgWhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: fonts.bodyRegular,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              children: [
                if (localValueLabel != null) ...[
                  Text(localValueLabel, style: fonts.xsLabel),
                  UiKitSpacing.x4.w,
                ],
                const Icon(
                  Icons.arrow_forward_ios,
                  size: UiKitSize.x4,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
