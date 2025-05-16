import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/src/theme/theme.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/colors.dart';
import 'package:tarot_ui_kit/src/theme/theme_extensions/fonts.dart';

extension UiKitContextExtension on BuildContext {
  UiKitFonts get fonts => Theme.of(this).extension<UiKitFonts>() ?? UiKitTheme.fonts;

  UiKitColors get colors => Theme.of(this).extension<UiKitColors>() ?? UiKitTheme.lightThemeColors;
}
