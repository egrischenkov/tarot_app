import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/profile/ui/widgets/profile_header_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: UiKitAppBar(
        title: l10n.profileScreen$Title,
        actions: const [
          Icon(Icons.upload_rounded),
          Icon(Icons.settings),
        ],
        onBack: () => context.router.pop(),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colors.lightYellow, colors.accentYellowSec],
              ),
            ),
          ),
          Stack(
            children: [
              // This widget is needed to cover bottom part of screen with background color
              // which corresponds to profile screen background.
              // It is needed to achieve transparent background for avatar widget and at the same time consistent background color for ListView.
              //
              // For example, if we remove this widget, then when we scroll ListView to the top,
              // we will see that background color of ListView is different from background color of ListView body.
              Positioned(
                bottom: 0,
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: ColoredBox(color: colors.whiteBgSecondary),
              ),
              ListView(
                padding: const EdgeInsets.only(
                  top: kToolbarHeight + UiKitAppBar.height + UiKitSpacing.x10,
                ),
                children: [
                  const ProfileHeaderWidget(name: 'Лолкек Лолкекович'),
                  ColoredBox(
                    color: colors.whiteBgSecondary,
                    child: Column(
                      children: [
                        UiKitSpacing.x4.h,
                        ...intersperse(
                          UiKitSpacing.x4.h,
                          [
                            Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(
                                horizontal: UiKitSpacing.x2,
                              ),
                              decoration: BoxDecoration(
                                color: colors.whiteBgWhite,
                                borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                              ),
                            ),
                            Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(
                                horizontal: UiKitSpacing.x2,
                              ),
                              decoration: BoxDecoration(
                                color: colors.whiteBgWhite,
                                borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                              ),
                            ),
                            Container(
                              height: 150,
                              margin: const EdgeInsets.symmetric(
                                horizontal: UiKitSpacing.x2,
                              ),
                              decoration: BoxDecoration(
                                color: colors.whiteBgWhite,
                                borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                              ),
                            ),
                            UiKitSpacing.x4.h,
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
