import 'package:flutter/material.dart';

@immutable
class UiKitColors extends ThemeExtension<UiKitColors> {
  final Color white;
  final Color grey;
  final Color textUnselected;
  final Color onSurface;
  final Color deepOrange;
  final Color yellow;

  const UiKitColors({
    required this.white,
    required this.grey,
    required this.textUnselected,
    required this.onSurface,
    required this.deepOrange,
    required this.yellow,
  });

  @override
  UiKitColors copyWith({
    Color? white,
    Color? grey,
    Color? textUnselected,
    Color? onSurface,
    Color? deepOrange,
    Color? yellow,
  }) {
    return UiKitColors(
      white: white ?? this.white,
      grey: grey ?? this.grey,
      textUnselected: textUnselected ?? this.textUnselected,
      onSurface: onSurface ?? this.onSurface,
      deepOrange: deepOrange ?? this.deepOrange,
      yellow: yellow ?? this.yellow,
    );
  }

  @override
  UiKitColors lerp(UiKitColors? other, double t) {
    if (other is! UiKitColors) {
      return this;
    }
    return UiKitColors(
      white: Color.lerp(white, other.white, t) ?? other.white,
      grey: Color.lerp(grey, other.grey, t) ?? other.grey,
      textUnselected: Color.lerp(textUnselected, other.textUnselected, t) ?? other.textUnselected,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? other.onSurface,
      deepOrange: Color.lerp(deepOrange, other.deepOrange, t) ?? other.deepOrange,
      yellow: Color.lerp(yellow, other.yellow, t) ?? other.yellow,
    );
  }
}
