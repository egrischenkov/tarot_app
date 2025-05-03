import 'package:flutter/material.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:taro/core/routing/app_router.dart';

class App extends StatelessWidget {
  final AppDependenciesContainer dependenciesContainer;

  App({required this.dependenciesContainer, super.key});

  final _router = AppRouter(navigatorKey: AppRouter.rootRouterGlobalKey);

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: const AppDependenciesContainer(),
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router.config(),
      ),
    );
  }
}
