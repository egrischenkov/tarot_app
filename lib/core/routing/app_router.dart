import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/features/debug/ui/debug_screen.dart';
import 'package:taro/features/debug/ui/debug_wrapper_entry.dart';
import 'package:taro/features/home/ui/home_screen.dart';
import 'package:taro/features/splash/ui/splash_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Entry,Route')
class AppRouter extends RootStackRouter {
  /// Don't use this key without an urgent need
  /// For most popular cases u can get access to router with context.router
  static final rootRouterGlobalKey = GlobalKey<NavigatorState>(debugLabel: 'App router global key');

  AppRouter() : super(navigatorKey: rootRouterGlobalKey);

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: DebugWrapperRoute.page,
          children: [
            AutoRoute(initial: true, page: SplashRoute.page),
            AutoRoute(page: DebugRoute.page),
            AutoRoute(page: HomeRoute.page),
          ],
        ),
      ];
}
