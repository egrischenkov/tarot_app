import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/features/settings/ui/extensions/language_option_extension.dart';
import 'package:taro/features/settings/ui/extensions/theme_option_extension.dart';
import 'package:taro/features/settings/ui/widgets/change_language_bottom_sheet.dart';
import 'package:taro/features/settings/ui/widgets/change_theme_bottom_sheet.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class SettingsSectionWidget extends StatelessWidget {
  final bool isAuthenticated;

  const SettingsSectionWidget({
    required this.isAuthenticated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return UiKitLineItemsGroup(
      title: l10n.settingsScreen$App,
      items: [
        UiKitLineItem(
          label: l10n.settingsScreen$ChangeTheme,
          onTap: () => _onChangeThemeTap(context),
          valueLabel: context.watch<ThemeBloc>().state.themeOption.getLabel(context),
        ),
        UiKitLineItem(
          label: l10n.settingsScreen$ChangeLanguage,
          onTap: () => _onChangeLanguageTap(context),
          valueLabel: context.read<LanguageBloc>().state.languageOption.getLabel(context),
        ),
        if (isAuthenticated)
          UiKitLineItem(
            label: l10n.settingsScreen$FeedbackForm,
            onTap: () => _onFeedbackFormTap(context),
          ),
        UiKitLineItem(
          label: l10n.settingsScreen$AboutApp,
          onTap: () => _onAboutTap(context),
        ),
      ],
    );
  }

  void _onChangeThemeTap(BuildContext context) {
    ChangeThemeBottomSheet.show(context: context);
  }

  void _onChangeLanguageTap(BuildContext context) {
    ChangeLanguageBottomSheet.show(context: context);
  }

  void _onFeedbackFormTap(BuildContext context) {
    context.router.push(const FeedbackFormRoute());
  }

  void _onAboutTap(BuildContext context) {
    context.router.push(const AboutRoute());
  }
}
