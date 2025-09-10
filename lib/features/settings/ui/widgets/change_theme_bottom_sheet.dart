import 'package:flutter/material.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ChangeThemeBottomSheet extends StatefulWidget {
  const ChangeThemeBottomSheet._();

  @override
  State<ChangeThemeBottomSheet> createState() => _ChangeThemeBottomSheetState();

  static Future<void> show({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: context.colors.transparent,
      builder: (_) => const ChangeThemeBottomSheet._(),
    );
  }
}

class _ChangeThemeBottomSheetState extends State<ChangeThemeBottomSheet> {
  ThemeOption selectedTheme = ThemeOption.system;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return UiKitBottomSheetWrapper(
      body: Column(
        children: intersperse(
          Divider(
            height: UiKitSpacing.x4,
            color: colors.backgroundSecondary,
          ),
          ThemeOption.values.map((value) {
            return UiKitBottomSheetValueItem(
              label: value.getLabel(context),
              isSelected: selectedTheme == value,
              onTap: () => _onThemeOptionTap(value),
              trailing: value.getTrailingIcon(),
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

extension _ThemeOptionX on ThemeOption {
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
