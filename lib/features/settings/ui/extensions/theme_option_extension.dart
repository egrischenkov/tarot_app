import 'package:flutter/material.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

extension ThemeOptionX on ThemeOption {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      ThemeOption.light => l10n.settingsScreen$Theme$Light,
      ThemeOption.dark => l10n.settingsScreen$Theme$Dark,
      ThemeOption.system => l10n.settingsScreen$Theme$System,
    };
  }

  Widget getTrailingIcon(BuildContext context) {
    final colors = context.colors;

    return switch (this) {
      ThemeOption.light => Icon(
          Icons.light_mode_outlined,
          color: colors.icon,
        ),
      ThemeOption.dark => Icon(
          Icons.dark_mode_outlined,
          color: colors.icon,
        ),
      ThemeOption.system => Icon(
          Icons.settings_display_outlined,
          color: colors.icon,
        ),
    };
  }
}
