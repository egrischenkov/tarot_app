import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/ui/bloc/language_bloc/language_bloc.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ChangeLanguageBottomSheet extends StatelessWidget {
  static Future<void> show({
    required BuildContext context,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: context.colors.transparent,
      builder: (_) => const ChangeLanguageBottomSheet._(),
    );
  }

  const ChangeLanguageBottomSheet._();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return UiKitBottomSheetWrapper(
      body: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          return Column(
            children: intersperse(
              Divider(
                height: UiKitSpacing.x4,
                color: colors.whiteBgSecondary,
              ),
              LanguageOption.values.map((value) {
                return UiKitBottomSheetValueItem(
                  label: value.getLabel(context),
                  isSelected: state.languageOption == value,
                  onTap: () => _onLanguageOptionTap(context, value),
                );
              }).toList(),
            ).toList(),
          );
        },
      ),
    );
  }

  void _onLanguageOptionTap(BuildContext context, LanguageOption languageOption) {
    context.read<LanguageBloc>().add(
          LanguageEvent.languageChanged(
            languageOption: languageOption,
          ),
        );
  }
}

extension _LanguageOptionX on LanguageOption {
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
