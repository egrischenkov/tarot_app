import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';
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
              title: l10n.profileScreen$Title,
              items: [
                UiKitLineItem(
                  label: l10n.settingsScreen$EditProfile,
                  onTap: () {},
                ),
                UiKitLineItem(
                  label: l10n.settingsScreen$ManageSubscription,
                  onTap: () {},
                ),
                UiKitLineItem(
                  label: 'Настройка уведомлений',
                  onTap: () => _onNotificationsTap(context),
                ),
              ],
            ),
            UiKitSpacing.x4.h,
            const SettingsSectionWidget(isAuthenticated: true),
            UiKitSpacing.x4.h,
            BlocConsumer<ProfileBloc, ProfileState>(
              listener: (context, state) => state.maybeMap(
                error: (_) {
                  final snackBar = SnackBar(
                    content: Text(context.l10n.common$Error),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                idle: (_) {
                  router.pop();
                },
                orElse: () {},
              ),
              builder: (context, state) {
                return UiKitBaseSectionWrapper(
                  child: UiKitBigButton.regular(
                    context: context,
                    label: l10n.settingsScreen$LogOut,
                    isLoading: state.isLoading,
                    isExpanded: true,
                    onTap: () => _onLoggedOut(context),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _onLoggedOut(BuildContext context) {
    final profileBloc = context.read<ProfileBloc>();

    profileBloc.add(const ProfileEvent.loggedOut());
  }

  void _onNotificationsTap(BuildContext context) {
    context.router.push(const NotificationsRoute());
  }
}
