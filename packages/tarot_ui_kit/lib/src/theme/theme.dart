import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/assets/gen/fonts.gen.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/colors.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/fonts.dart';

class UiKitTheme {
  static final light = ThemeData(
    useMaterial3: true,
    extensions: [
      lightThemeColors,
      fonts,
    ],
    scaffoldBackgroundColor: lightThemeColors.white,
    // TODO(egrischenkov): return back when we decide which color scheme to use
    // colorScheme: ColorScheme.fromSeed(seedColor: lightThemeColors.accent)
    //     .copyWith(surface: lightThemeColors.white),
  );

  static final lightThemeColors = UiKitColors(
    white: Colors.white,
    grey: Colors.grey.withValues(alpha: 0.9),
    textUnselected: const Color(0xFF090909),
    onSurface: const Color(0xFF1D1B20),
    deepOrange: const Color(0xFFF0A400),
    yellow: const Color(0xFFFFE397),
  );

  static const fonts = UiKitFonts(
    testStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 14 / 12,
      letterSpacing: -0.4,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 32,
      fontWeight: FontWeight.w600,
      height: 40 / 32,
      letterSpacing: 0,
    ),
    titleLarge: TextStyle(
      fontFamily: FontFamily.poppins,
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 28 / 22,
      letterSpacing: 0,
    ),
  );
}
