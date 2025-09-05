import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/settings/domain/entities/theme_option.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet._();

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();

  static Future<void> show({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: context.colors.transparent,
      builder: (_) => const ThemeBottomSheet._(),
    );
  }
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  ThemeOption selectedTheme = ThemeOption.system;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return UiKitBottomSheetWrapper(
      body: Column(
        children: intersperse(
          Divider(
            height: UiKitSpacing.x4,
            color: colors.whiteBgSecondary,
          ),
          ThemeOption.values.map((value) {
            return UiKitBottomSheetValueItem(
              label: value.getLabel(context),
              isSelected: selectedTheme == value,
              onTap: () => _onThemeOptionTap(value),
            );
          }).toList(),
        ).toList(),
      ),
    );
  }

  void _onThemeOptionTap(ThemeOption theme) {
    setState(() {
      selectedTheme = theme;
    });
  }
}

extension ThemeOptionX on ThemeOption {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    switch (this) {
      case ThemeOption.light:
        return l10n.settingsScreen$Theme$Light;
      case ThemeOption.dark:
        return l10n.settingsScreen$Theme$Dark;
      case ThemeOption.system:
        return l10n.settingsScreen$Theme$System;
    }
  }
}
