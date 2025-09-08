import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitCheckboxLineItem extends StatelessWidget {
  final String title;
  final ValueSetter<bool?> onChanged;
  final bool isSelected;

  const UiKitCheckboxLineItem({
    required this.title,
    required this.onChanged,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.whiteBgWhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: fonts.bodyRegular,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          UiKitSpacing.x2.w,
          Checkbox(
            value: isSelected,
            fillColor: WidgetStateProperty.resolveWith((states) {
              if (!states.contains(WidgetState.selected)) {
                return colors.whiteBgWhite;
              }
              return null;
            }),
            side: BorderSide(color: colors.grey),
            onChanged: onChanged,
            shape: const CircleBorder(),
            checkColor: colors.whiteBgWhite,
            activeColor: colors.accentYellow,
          ),
        ],
      ),
    );
  }
}
