import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/settings/ui/widgets/change_language_bottom_sheet.dart';
import 'package:taro/features/settings/ui/widgets/change_theme_bottom_sheet.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final l10n = context.l10n;
    final colors = context.colors;

    return UiKitBaseScreen(
      title: l10n.settingsScreen$Title,
      onBack: router.pop,
      bodyWithAppBarOffset: true,
      backgroundColor: colors.whiteBgSecondary,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UiKitSpacing.x2,
        ),
        child: Column(
          children: [
            UiKitSpacing.x4.h,
            UiKitLineItemsGroup(
              title: l10n.settingsScreen$Title,
              items: [
                UiKitLineItem(
                  title: l10n.settingsScreen$EditProfile,
                  onTap: () {},
                ),
                UiKitLineItem(
                  title: l10n.settingsScreen$ManageSubscription,
                  onTap: () {},
                ),
              ],
            ),
            UiKitSpacing.x4.h,
            UiKitLineItemsGroup(
              title: l10n.settingsScreen$App,
              items: [
                UiKitLineItem(
                  title: l10n.settingsScreen$ChangeTheme,
                  onTap: _onChangeThemeTap,
                ),
                UiKitLineItem(
                  title: l10n.settingsScreen$ChangeLanguage,
                  onTap: _onChangeLanguageTap,
                ),
                UiKitLineItem(
                  title: l10n.settingsScreen$FeedbackForm,
                  onTap: () {},
                ),
                UiKitLineItem(
                  title: l10n.settingsScreen$AboutApp,
                  onTap: () {},
                ),
              ],
            ),
            UiKitSpacing.x4.h,
            Container(
              padding: const EdgeInsets.all(UiKitSpacing.x4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(UiKitRadius.x4),
                color: colors.whiteBgWhite,
              ),
              child: UiKitBigButton.regular(
                context: context,
                label: l10n.settingsScreen$LogOut,
                isExpanded: true,
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChangeThemeTap() {
    ChangeThemeBottomSheet.show(context: context);
  }

  void _onChangeLanguageTap() {
    ChangeLanguageBottomSheet.show(context: context);
  }
}
