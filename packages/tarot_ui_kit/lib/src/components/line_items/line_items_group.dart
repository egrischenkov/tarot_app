import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitLineItemsGroup extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const UiKitLineItemsGroup({
    required this.title,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return UiKitBaseSectionWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.fonts.headlineLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          ...intersperse(
            Divider(
              height: UiKitSpacing.x5,
              color: colors.backgroundSecondary,
            ),
            items,
            insertFirst: true,
          ),
        ],
      ),
    );
  }
}
