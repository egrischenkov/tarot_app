import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/colors.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/fonts.dart';

class UiKitTheme {
  static final light = ThemeData(
    useMaterial3: true,
    // TODO(egrischenkov): return back when we decide which font to use
    // fontFamily: FontFamily.sFProDisplay,
    extensions: const [
      lightThemeColors,
      fonts,
    ],
    scaffoldBackgroundColor: lightThemeColors.white,
    // TODO(egrischenkov): return back when we decide which color scheme to use
    // colorScheme: ColorScheme.fromSeed(seedColor: lightThemeColors.accent)
    //     .copyWith(surface: lightThemeColors.white),
  );

  static const lightThemeColors = UiKitColors(
    white: Colors.white,
  );

  static const fonts = UiKitFonts(
    testStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 14 / 12,
      letterSpacing: -0.4,
    ),
  );
}
