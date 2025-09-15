import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/features/settings/ui/extensions/theme_option_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class ChangeThemeBottomSheet extends StatelessWidget {
  const ChangeThemeBottomSheet._();

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

  @visibleForTesting
  static Widget getBodyForTest() => const ChangeThemeBottomSheet._();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return UiKitBottomSheetWrapper(
      body: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return Column(
            children: intersperse(
              Divider(
                height: UiKitSpacing.x4,
                color: colors.backgroundSecondary,
              ),
              ThemeOption.values.map((value) {
                return UiKitBottomSheetValueItem(
                  label: value.getLabel(context),
                  isSelected: state.themeOption == value,
                  onTap: () => _onThemeOptionTap(context, value),
                  trailing: value.getTrailingIcon(context),
                );
              }).toList(),
            ).toList(),
          );
        },
      ),
    );
  }

  void _onThemeOptionTap(BuildContext context, ThemeOption themeOption) {
    context.read<ThemeBloc>().add(
          ThemeEvent.themeChanged(
            themeOption: themeOption,
          ),
        );
  }
}
