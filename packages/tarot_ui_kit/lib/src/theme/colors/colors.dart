import 'package:flutter/material.dart';

@immutable
class UiKitColors extends ThemeExtension<UiKitColors> {
  final Color accent;
  final Color accentSecondary;
  final Color accentTertiary;
  final Color text;
  final Color buttonText;
  final Color textDisabled;
  final Color background;
  final Color backgroundSecondary;
  final Color success;
  final Color error;
  final Color transparent;
  final Color disabled;
  final Color gradientFirst;
  final Color gradientSecond;
  final Color borderGradientFirst;
  final Color borderGradientSecond;
  final Color iconColor;
  final Color iconBackground;

  const UiKitColors({
    required this.accent,
    required this.accentSecondary,
    required this.accentTertiary,
    required this.text,
    required this.buttonText,
    required this.textDisabled,
    required this.background,
    required this.backgroundSecondary,
    required this.success,
    required this.error,
    required this.transparent,
    required this.disabled,
    required this.gradientFirst,
    required this.gradientSecond,
    required this.borderGradientFirst,
    required this.borderGradientSecond,
    required this.iconColor,
    required this.iconBackground,
  });

  @override
  UiKitColors copyWith({
    Color? accent,
    Color? accentSecondary,
    Color? accentTertiary,
    Color? text,
    Color? buttonText,
    Color? textDisabled,
    Color? background,
    Color? backgroundSecondary,
    Color? success,
    Color? error,
    Color? transparent,
    Color? disabled,
    Color? gradientFirst,
    Color? gradientSecond,
    Color? borderGradientFirst,
    Color? borderGradientSecond,
    Color? iconColor,
    Color? iconBackground,
  }) {
    return UiKitColors(
      accentTertiary: accentTertiary ?? this.accentTertiary,
      accent: accent ?? this.accent,
      accentSecondary: accentSecondary ?? this.accentSecondary,
      text: text ?? this.text,
      buttonText: buttonText ?? this.buttonText,
      textDisabled: textDisabled ?? this.textDisabled,
      background: background ?? this.background,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      success: success ?? this.success,
      error: error ?? this.error,
      transparent: transparent ?? this.transparent,
      disabled: disabled ?? this.disabled,
      gradientFirst: gradientFirst ?? this.gradientFirst,
      gradientSecond: gradientSecond ?? this.gradientSecond,
      borderGradientFirst: borderGradientFirst ?? this.borderGradientFirst,
      borderGradientSecond: borderGradientSecond ?? this.borderGradientSecond,
      iconColor: iconColor ?? this.iconColor,
      iconBackground: iconBackground ?? this.iconBackground,
    );
  }

  @override
  UiKitColors lerp(UiKitColors? other, double t) {
    if (other is! UiKitColors) {
      return this;
    }
    return UiKitColors(
      accent: Color.lerp(accent, other.accent, t) ?? other.accent,
      accentSecondary: Color.lerp(accentSecondary, other.accentSecondary, t) ?? other.accentSecondary,
      accentTertiary: Color.lerp(accentTertiary, other.accentTertiary, t) ?? other.accentTertiary,
      text: Color.lerp(text, other.text, t) ?? other.text,
      buttonText: Color.lerp(buttonText, other.buttonText, t) ?? other.buttonText,
      textDisabled: Color.lerp(textDisabled, other.textDisabled, t) ?? other.textDisabled,
      background: Color.lerp(background, other.background, t) ?? other.background,
      backgroundSecondary: Color.lerp(backgroundSecondary, other.backgroundSecondary, t) ?? other.backgroundSecondary,
      success: Color.lerp(success, other.success, t) ?? other.success,
      error: Color.lerp(error, other.error, t) ?? other.error,
      transparent: Color.lerp(transparent, other.transparent, t) ?? other.transparent,
      disabled: Color.lerp(disabled, other.disabled, t) ?? other.disabled,
      gradientFirst: Color.lerp(gradientFirst, other.gradientFirst, t) ?? other.gradientFirst,
      gradientSecond: Color.lerp(gradientSecond, other.gradientSecond, t) ?? other.gradientSecond,
      borderGradientFirst: Color.lerp(borderGradientFirst, other.borderGradientFirst, t) ?? other.borderGradientFirst,
      borderGradientSecond:
          Color.lerp(borderGradientSecond, other.borderGradientSecond, t) ?? other.borderGradientSecond,
      iconColor: Color.lerp(iconColor, other.iconColor, t) ?? other.iconColor,
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t) ?? other.iconBackground,
    );
  }
}
