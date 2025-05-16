import 'package:flutter/material.dart';

@immutable
class UiKitFonts extends ThemeExtension<UiKitFonts> {
  final TextStyle testStyle;

  const UiKitFonts({
    required this.testStyle,
  });

  @override
  UiKitFonts copyWith({
    TextStyle? testStyle,
  }) {
    return UiKitFonts(
      testStyle: testStyle ?? this.testStyle,
    );
  }

  @override
  UiKitFonts lerp(UiKitFonts? other, double t) {
    if (other is! UiKitFonts) {
      return this;
    }
    return UiKitFonts(
      testStyle: TextStyle.lerp(testStyle, other.testStyle, t) ?? other.testStyle,
    );
  }
}
