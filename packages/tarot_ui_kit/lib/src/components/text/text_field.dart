import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class UiKitTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLength;
  final int? maxLines;

  const UiKitTextField({
    this.controller,
    this.hintText,
    this.maxLength,
    this.maxLines,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    return TextField(
      controller: controller,
      style: fonts.bodyRegular,
      decoration: InputDecoration(
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UiKitRadius.x3),
          borderSide: BorderSide(
            color: colors.border,
            width: UiKitSize.base / 2,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UiKitRadius.x3),
          borderSide: BorderSide(
            color: colors.border,
            width: UiKitSize.base / 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UiKitRadius.x3),
          borderSide: BorderSide(
            color: colors.disabled,
            width: UiKitSize.base / 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(UiKitRadius.x3),
          borderSide: BorderSide(
            color: colors.border,
            width: UiKitSize.base / 2,
          ),
        ),
        hintText: hintText,
        hintStyle: fonts.xsLabel.copyWith(color: colors.textDisabled),
      ),
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }
}
