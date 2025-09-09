import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/ui/bloc/language_bloc/language_bloc.dart';
import 'package:taro/features/settings/ui/extensions/language_option_extension.dart';
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
