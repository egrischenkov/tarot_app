import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/settings/ui/widgets/settings_section_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final router = context.router;
    final l10n = context.l10n;
    final colors = context.colors;

    return UiKitBaseScreen(
      title: l10n.settingsScreen$Title,
      onBack: router.pop,
      bodyWithAppBarOffset: true,
      backgroundColor: colors.backgroundSecondary,
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
                  label: l10n.settingsScreen$EditProfile,
                  onTap: () {},
                ),
                UiKitLineItem(
                  label: l10n.settingsScreen$ManageSubscription,
                  onTap: () {},
                ),
              ],
            ),
            UiKitSpacing.x4.h,
            const SettingsSectionWidget(isAuthenticated: true),
            UiKitSpacing.x4.h,
            UiKitBaseSectionWrapper(
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
}
