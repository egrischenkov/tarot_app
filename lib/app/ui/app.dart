import 'package:flutter/material.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/routing/guards/onboarding_guard.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class App extends StatelessWidget {
  final AppDependenciesContainer _dependenciesContainer;
  final AppRouter _router;

  App({
    required AppDependenciesContainer dependenciesContainer,
    super.key,
  })  : _dependenciesContainer = dependenciesContainer,
        _router = AppRouter(
          onboardingGuard: OnboardingGuard(
            sharedPreferencesStorage: dependenciesContainer.appConfigurationsStorage,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: _dependenciesContainer,
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        routerConfig: _router.config(navigatorObservers: () => [HeroController()]),
        theme: UiKitTheme.light,
      ),
    );
  }
}
