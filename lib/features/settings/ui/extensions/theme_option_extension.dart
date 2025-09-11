import 'package:flutter/material.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/core/extensions/context_extension.dart';

extension ThemeOptionX on ThemeOption {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      ThemeOption.light => l10n.settingsScreen$Theme$Light,
      ThemeOption.dark => l10n.settingsScreen$Theme$Dark,
      ThemeOption.system => l10n.settingsScreen$Theme$System,
    };
  }

  Widget getTrailingIcon() {
    return switch (this) {
      ThemeOption.light => const Icon(Icons.light_mode_outlined),
      ThemeOption.dark => const Icon(Icons.dark_mode_outlined),
      ThemeOption.system => const Icon(Icons.settings_display_outlined),
    };
  }
}
