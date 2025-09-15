import 'package:flutter/widgets.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/core/extensions/context_extension.dart';

extension LanguageOptionExtension on LanguageOption {
  String getLabel(BuildContext context) {
    final l10n = context.l10n;

    return switch (this) {
      LanguageOption.russian => l10n.settingsScreen$Language$Ru,
      LanguageOption.english => l10n.settingsScreen$Language$En,
      LanguageOption.german => l10n.settingsScreen$Language$De,
      LanguageOption.spanish => l10n.settingsScreen$Language$Es,
      LanguageOption.french => l10n.settingsScreen$Language$Fr,
      LanguageOption.hindi => l10n.settingsScreen$Language$Hi,
      LanguageOption.italian => l10n.settingsScreen$Language$It,
      LanguageOption.portuguese => l10n.settingsScreen$Language$Pt,
      LanguageOption.chinese => l10n.settingsScreen$Language$Zh,
    };
  }
}
