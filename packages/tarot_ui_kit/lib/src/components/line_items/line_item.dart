import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitLineItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const UiKitLineItem({
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

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
              title,
              style: fonts.bodyRegular,
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: UiKitSize.x4,
            ),
          ],
        ),
      ),
    );
  }
}
