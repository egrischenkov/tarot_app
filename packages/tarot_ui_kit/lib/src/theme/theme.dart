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
    scaffoldBackgroundColor: lightThemeColors.whiteBgWhite,
    // TODO(egrischenkov): return back when we decide which color scheme to use
    // colorScheme: ColorScheme.fromSeed(seedColor: lightThemeColors.accent)
    //     .copyWith(surface: lightThemeColors.white),
  );

  static final lightThemeColors = UiKitColors(
    grey: Colors.grey.withValues(alpha: 0.9),
    textUnselected: const Color(0xFF090909),
    onSurface: const Color(0xFF1D1B20),
    deepOrange: const Color(0xFFF0A400),
    yellow: const Color(0xFFFFE397),
    lightYellow: const Color(0xFFfbe7aa),
    accentOrange: const Color(0xFFFF8F3C),
    accentYellow: const Color(0xFFFFD964),
    accentYellowSec: const Color(0xFFFFB62C),
    accentPurple: const Color(0xFF8240E6),
    accentPurpleSec: const Color(0xFF6B2DC8),
    purpleText: const Color(0xFF521DA3),
    itsyBitsyBlack: const Color(0xFF2E2E2E),
    greyText: const Color(0xFF86848B),
    whiteText: const Color(0xFFFCFCFC),
    whiteBgWhite: Colors.white,
    whiteBgSecondary: const Color(0xFFF4F1F8),
    blackBgMudberry: const Color(0xFF3B2F63),
    blackBgPurple: const Color(0xFF635983),
    goodGreen: const Color(0xFFA6E3A1),
    wrongRed: const Color(0xFFF6A6A6),
    transparent: Colors.transparent,
  );

  static final fonts = UiKitFonts(
    testStyle: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 14 / 12,
      letterSpacing: -0.4,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    headlineRegular: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 22 / 17,
      letterSpacing: -0.43,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    headlineLarge: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 40 / 28,
      letterSpacing: 0,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    largeTitleEmphasized: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 34,
      fontWeight: FontWeight.w700,
      height: 41 / 34,
      letterSpacing: -0.4,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    largeTitleRegular: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 34,
      fontWeight: FontWeight.w400,
      height: 41 / 34,
      letterSpacing: -0.4,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    bodyRegular: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 17,
      fontWeight: FontWeight.w400,
      height: 22 / 17,
      letterSpacing: -0.43,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    bodyEmphasized: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      height: 22 / 17,
      letterSpacing: -0.43,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    bodyEmphasizedItalic: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 17,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.italic,
      height: 22 / 17,
      letterSpacing: -0.43,
      color: lightThemeColors.itsyBitsyBlack,
    ),
    xsLabel: TextStyle(
      fontFamily: FontFamily.sFProDisplay,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 12 / 10,
      letterSpacing: 0,
      color: lightThemeColors.itsyBitsyBlack,
    ),
  );
}
