import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fonts = context.fonts;
    final router = context.router;

    return UiKitBaseScreen(
      title: l10n.aboutScreen$Title,
      onBack: router.pop,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.aboutIcon.svg(
                  width: 100,
                  height: 100,
                ),
                UiKitSpacing.x4.h,
                Text(l10n.appName, style: fonts.headlineLarge),
              ],
            ),
          ),
          Positioned(
            bottom: UiKitSize.x10,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(l10n.companyName, style: fonts.bodyRegular),
                UiKitTextLink(
                  text: l10n.aboutScreen$PrivacyPolicy,
                  onTap: _onPrivacyPolicyTap,
                ),
                UiKitTextLink(
                  text: l10n.aboutScreen$TermsOfService,
                  onTap: _onTermsOfServiceTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPrivacyPolicyTap() {}

  void _onTermsOfServiceTap() {}
}
