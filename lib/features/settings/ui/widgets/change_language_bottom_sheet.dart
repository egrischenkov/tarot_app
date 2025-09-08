import 'package:flutter/material.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ChangeLanguageBottomSheet extends StatefulWidget {
  const ChangeLanguageBottomSheet._();

  @override
  State<ChangeLanguageBottomSheet> createState() => _ChangeLanguageBottomSheetState();

  static Future<void> show({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      backgroundColor: context.colors.transparent,
      builder: (_) => const ChangeLanguageBottomSheet._(),
    );
  }
}

class _ChangeLanguageBottomSheetState extends State<ChangeLanguageBottomSheet> {
  LanguageOption selectedLanguage = LanguageOption.ru;

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
          LanguageOption.values.map((value) {
            return UiKitBottomSheetValueItem(
              label: value.getLabel(context),
              isSelected: selectedLanguage == value,
              onTap: () => _onLanguageOptionTap(value),
            );
          }).toList(),
        ).toList(),
      ),
    );
  }

  void _onLanguageOptionTap(LanguageOption language) {
    setState(() {
      selectedLanguage = language;
    });
  }
}

extension _LanguageOptionX on LanguageOption {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      LanguageOption.ru => l10n.settingsScreen$Theme$Light,
      LanguageOption.en => l10n.settingsScreen$Theme$Dark,
    };
  }
}
