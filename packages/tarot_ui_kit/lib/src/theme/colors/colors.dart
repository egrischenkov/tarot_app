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
  final Color border;
  final Color borderGradientFirst;
  final Color borderGradientSecond;
  final Color icon;
  final Color iconBackground;
  final Color shadow;
  final Color link;
  final Color onboardingBackground1;
  final Color onboardingBackground2;
  final Color onboardingBackground3;
  final Color menuCardGradientFirst;
  final Color menuCardGradientSecond;
  final Color menuCardContent;

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
    required this.border,
    required this.borderGradientFirst,
    required this.borderGradientSecond,
    required this.icon,
    required this.iconBackground,
    required this.shadow,
    required this.link,
    required this.onboardingBackground1,
    required this.onboardingBackground2,
    required this.onboardingBackground3,
    required this.menuCardGradientFirst,
    required this.menuCardGradientSecond,
    required this.menuCardContent,
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
    Color? border,
    Color? gradientFirst,
    Color? gradientSecond,
    Color? borderGradientFirst,
    Color? borderGradientSecond,
    Color? icon,
    Color? iconBackground,
    Color? shadow,
    Color? link,
    Color? onboardingBackground1,
    Color? onboardingBackground2,
    Color? onboardingBackground3,
    Color? menuCardGradientFirst,
    Color? menuCardGradientSecond,
    Color? menuCardContent,
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
      border: border ?? this.border,
      gradientFirst: gradientFirst ?? this.gradientFirst,
      gradientSecond: gradientSecond ?? this.gradientSecond,
      borderGradientFirst: borderGradientFirst ?? this.borderGradientFirst,
      borderGradientSecond: borderGradientSecond ?? this.borderGradientSecond,
      icon: icon ?? this.icon,
      iconBackground: iconBackground ?? this.iconBackground,
      shadow: shadow ?? this.shadow,
      link: link ?? this.link,
      onboardingBackground1: onboardingBackground1 ?? this.onboardingBackground1,
      onboardingBackground2: onboardingBackground2 ?? this.onboardingBackground2,
      onboardingBackground3: onboardingBackground3 ?? this.onboardingBackground3,
      menuCardGradientFirst: menuCardGradientFirst ?? this.menuCardGradientFirst,
      menuCardGradientSecond: menuCardGradientSecond ?? this.menuCardGradientSecond,
      menuCardContent: menuCardContent ?? this.menuCardContent,
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
      border: Color.lerp(border, other.border, t) ?? other.border,
      gradientFirst: Color.lerp(gradientFirst, other.gradientFirst, t) ?? other.gradientFirst,
      gradientSecond: Color.lerp(gradientSecond, other.gradientSecond, t) ?? other.gradientSecond,
      borderGradientFirst: Color.lerp(borderGradientFirst, other.borderGradientFirst, t) ?? other.borderGradientFirst,
      borderGradientSecond:
          Color.lerp(borderGradientSecond, other.borderGradientSecond, t) ?? other.borderGradientSecond,
      icon: Color.lerp(icon, other.icon, t) ?? other.icon,
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t) ?? other.iconBackground,
      shadow: Color.lerp(shadow, other.shadow, t) ?? other.shadow,
      link: Color.lerp(link, other.link, t) ?? other.link,
      onboardingBackground1:
          Color.lerp(onboardingBackground1, other.onboardingBackground1, t) ?? other.onboardingBackground1,
      onboardingBackground2:
          Color.lerp(onboardingBackground2, other.onboardingBackground2, t) ?? other.onboardingBackground2,
      onboardingBackground3:
          Color.lerp(onboardingBackground3, other.onboardingBackground3, t) ?? other.onboardingBackground3,
      menuCardGradientFirst:
          Color.lerp(menuCardGradientFirst, other.menuCardGradientFirst, t) ?? other.menuCardGradientFirst,
      menuCardGradientSecond:
          Color.lerp(menuCardGradientSecond, other.menuCardGradientSecond, t) ?? other.menuCardGradientSecond,
      menuCardContent: Color.lerp(menuCardContent, other.menuCardContent, t) ?? other.menuCardContent,
    );
  }
}
