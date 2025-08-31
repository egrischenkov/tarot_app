import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/features/profile/ui/widgets/profile_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

part 'widgets/profile_header_widget.dart';
part 'widgets/profile_item.dart';
part 'widgets/profile_refresh_indicator.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _scrollController = ScrollController();
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: UiKitAppBar(
        title: l10n.profileScreen$Title,
        actions: [
          GestureDetector(
            onTap: _onShareTap,
            behavior: HitTestBehavior.translucent,
            child: Assets.icons.share.svg(
              width: UiKitSize.x5,
              height: UiKitSize.x5,
            ),
          ),
          GestureDetector(
            onTap: _onSettingsTap,
            behavior: HitTestBehavior.translucent,
            child: Assets.icons.settings.svg(
              width: UiKitSize.x5,
              height: UiKitSize.x5,
            ),
          ),
        ],
        scrollOffset: _offset,
        onBack: () => context.router.pop(),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .6,
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
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                child: ColoredBox(color: colors.whiteBgSecondary),
              ),
              ProfileRefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: kToolbarHeight + UiKitAppBar.height + UiKitSpacing.x10,
                  ),
                  shrinkWrap: true,
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
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x2),
                                child: UiKitBorderBeam(
                                  borderWidth: 3,
                                  child: ProfileItem(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              l10n.profileScreen$Subscription,
                                              style: context.fonts.bodyEmphasized,
                                            ),
                                            const UiKitForwardButton(),
                                          ],
                                        ),
                                        UiKitSpacing.x3.h,
                                        Text(
                                          l10n.profileScreen$SuggestSubscription,
                                          style: context.fonts.xsLabel,
                                        ),
                                        UiKitSpacing.x3.h,
                                        UiKitBigButton.regular(
                                          context: context,
                                          label: l10n.profileScreen$ChooseSubscription,
                                          onTap: () {},
                                          isExpanded: true,
                                        ),
                                      ],
                                    ),
                                  ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onShareTap() {}

  void _onSettingsTap() {}

  Future<void> _onRefresh() async {
    // Simulate a refresh delay
    await Future.delayed(const Duration(seconds: 2));
  }
}
