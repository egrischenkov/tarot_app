import 'package:flutter/material.dart';

@immutable
class UiKitFonts extends ThemeExtension<UiKitFonts> {
  final TextStyle testStyle;
  final TextStyle headlineLarge;
  final TextStyle titleLarge;

  const UiKitFonts({
    required this.testStyle,
    required this.headlineLarge,
    required this.titleLarge,
  });

  @override
  UiKitFonts copyWith({
    TextStyle? testStyle,
    TextStyle? headlineLarge,
    TextStyle? titleLarge,
  }) {
    return UiKitFonts(
      testStyle: testStyle ?? this.testStyle,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      titleLarge: titleLarge ?? this.titleLarge,
    );
  }

  @override
  UiKitFonts lerp(UiKitFonts? other, double t) {
    if (other is! UiKitFonts) {
      return this;
    }
    return UiKitFonts(
      testStyle: TextStyle.lerp(testStyle, other.testStyle, t) ?? other.testStyle,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t) ?? other.headlineLarge,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t) ?? other.titleLarge,
    );
  }
}
