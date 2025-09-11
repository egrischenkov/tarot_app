import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/assets/gen/fonts.gen.dart';
import 'package:tarot_ui_kit/src/theme/colors/colors.dart';
import 'package:tarot_ui_kit/src/theme/fonts.dart';

class UiKitTheme {
  static final lightThemeData = ThemeData(
    useMaterial3: true,
    extensions: [
      lightThemeColors,
      fonts(lightThemeColors),
    ],
    brightness: Brightness.light,
  );

  static final darkThemeData = ThemeData(
    useMaterial3: true,
    extensions: [
      darkThemeColors,
      fonts(darkThemeColors),
    ],
    brightness: Brightness.dark,
  );

  static final lightThemeColors = UiKitColors(
    accent: const Color(0xFFFFD964),
    accentSecondary: const Color(0xFFFFB62C),
    accentTertiary: const Color(0xFFFF8F3C),
    text: const Color(0xFF2E2E2E),
    buttonText: const Color(0xFF2E2E2E),
    textDisabled: const Color(0xFF86848B),
    background: Colors.white,
    backgroundSecondary: const Color(0xFFF4F1F8),
    success: const Color(0xFFA6E3A1),
    error: const Color(0xFFF6A6A6),
    transparent: Colors.transparent,
    disabled: Colors.grey.withValues(alpha: 0.9),
    gradientFirst: const Color(0xFFfbe7aa),
    gradientSecond: const Color(0xFFFFB62C),
    borderGradientFirst: const Color(0xFFFFD964),
    borderGradientSecond: const Color(0xFF8240E6),
  );

  static final darkThemeColors = UiKitColors(
    accent: const Color(0xFFFFD964),
    accentSecondary: const Color(0xFFFFB62C),
    accentTertiary: const Color(0xFF521DA3),
    text: const Color(0xFFFCFCFC),
    buttonText: const Color(0xFF2E2E2E),
    textDisabled: const Color(0xFF86848B),
    background: const Color(0xFF1a1a1a),
    backgroundSecondary: const Color(0xFF010101),
    success: const Color(0xFFA6E3A1),
    error: const Color(0xFFF6A6A6),
    transparent: Colors.transparent,
    disabled: Colors.grey.withValues(alpha: 0.9),
    gradientFirst: const Color(0xFF7d7df6),
    gradientSecond: const Color(0xFF3035c3),
    borderGradientFirst: const Color(0xFFFFD964),
    borderGradientSecond: const Color(0xFF7d7df6),
  );

  static UiKitFonts fonts(UiKitColors colors) => UiKitFonts(
        headlineRegular: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 22 / 17,
          letterSpacing: -0.43,
          color: colors.text,
        ),
        headlineLarge: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 40 / 28,
          letterSpacing: 0,
          color: colors.text,
        ),
        largeTitleEmphasized: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 34,
          fontWeight: FontWeight.w700,
          height: 41 / 34,
          letterSpacing: -0.4,
          color: colors.text,
        ),
        largeTitleRegular: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 34,
          fontWeight: FontWeight.w400,
          height: 41 / 34,
          letterSpacing: -0.4,
          color: colors.text,
        ),
        bodyRegular: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          height: 22 / 17,
          letterSpacing: -0.43,
          color: colors.text,
        ),
        bodyEmphasized: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          height: 22 / 17,
          letterSpacing: -0.43,
          color: colors.text,
        ),
        bodyEmphasizedItalic: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 17,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          height: 22 / 17,
          letterSpacing: -0.43,
          color: colors.text,
        ),
        xsLabel: TextStyle(
          fontFamily: FontFamily.sFProDisplay,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 12 / 10,
          letterSpacing: 0,
          color: colors.text,
        ),
      );
}
