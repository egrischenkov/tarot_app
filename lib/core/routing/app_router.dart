import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/routing/guards/onboarding_guard.dart';
import 'package:taro/features/about/ui/about_screen.dart';
import 'package:taro/features/cards_catalog/ui/cards_catalog_screen.dart';
import 'package:taro/features/daily_card/ui/daily_card_screen.dart';
import 'package:taro/features/debug/ui/debug_screen.dart';
import 'package:taro/features/debug/ui/debug_wrapper_entry.dart';
import 'package:taro/features/feedback_form/ui/feedback_form_screen.dart';
import 'package:taro/features/home/ui/home_screen.dart';
import 'package:taro/features/onboarding/ui/onboarding_screen.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';
import 'package:taro/features/profile/ui/screens/auth_screen.dart';
import 'package:taro/features/profile/ui/screens/profile_screen.dart';
import 'package:taro/features/settings/ui/settings_screen.dart';
import 'package:taro/features/yes_no/ui/yes_no_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Entry,Route')
class AppRouter extends RootStackRouter {
  /// Don't use this key without an urgent need
  /// For most popular cases u can get access to router with context.router
  static final rootRouterGlobalKey = GlobalKey<NavigatorState>(debugLabel: 'App router global key');

  final OnboardingGuard _onboardingGuard;
  AppRouter({
    required OnboardingGuard onboardingGuard,
  })  : _onboardingGuard = onboardingGuard,
        super(navigatorKey: rootRouterGlobalKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: DebugWrapperRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: OnboardingRoute.page,
              guards: [_onboardingGuard],
            ),
            AutoRoute(page: DebugRoute.page),
            CustomRoute(
              page: HomeRoute.page,
              children: [
                AutoRoute(page: DailyCardRoute.page),
                AutoRoute(page: CardsCatalogRoute.page),
                AutoRoute(page: YesNoRoute.page),
              ],
              transitionsBuilder: TransitionsBuilders.fadeIn,
            ),

            // Profile
            AutoRoute(page: ProfileRoute.page),
            AutoRoute(page: AuthRoute.page),

            // Settings
            AutoRoute(page: SettingsRoute.page),
            AutoRoute(page: FeedbackFormRoute.page),
            AutoRoute(page: AboutRoute.page),
          ],
        ),
      ];
}
