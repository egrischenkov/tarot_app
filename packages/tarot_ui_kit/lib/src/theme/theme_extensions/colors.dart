import 'package:flutter/material.dart';

@immutable
class UiKitColors extends ThemeExtension<UiKitColors> {
  final Color white;

  const UiKitColors({
    required this.white,
  });

  @override
  UiKitColors copyWith({
    Color? white,
  }) {
    return UiKitColors(
      white: white ?? this.white,
    );
  }

  @override
  UiKitColors lerp(UiKitColors? other, double t) {
    if (other is! UiKitColors) {
      return this;
    }
    return UiKitColors(
      white: Color.lerp(white, other.white, t) ?? other.white,
    );
  }
}
