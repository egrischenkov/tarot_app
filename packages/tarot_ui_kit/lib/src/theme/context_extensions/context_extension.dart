import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/src/theme/colors/colors.dart';
import 'package:tarot_ui_kit/src/theme/fonts.dart';
import 'package:tarot_ui_kit/src/theme/theme.dart';

extension UiKitContextExtension on BuildContext {
  UiKitFonts get fonts => Theme.of(this).extension<UiKitFonts>() ?? UiKitTheme.fonts(UiKitTheme.lightThemeColors);

  UiKitColors get colors => Theme.of(this).extension<UiKitColors>() ?? UiKitTheme.lightThemeColors;
}
