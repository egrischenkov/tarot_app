import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitTextLink extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const UiKitTextLink({
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;
    final colors = context.colors;

    return TextButton(
      onPressed: onTap,
      child: Text(
        text,
        style: fonts.bodyRegular.copyWith(
          color: colors.link,
          decoration: TextDecoration.underline,
          decorationColor: colors.link,
        ),
      ),
    );
  }
}
