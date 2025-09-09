import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/data/repositories_implementations/app_repository_impl.dart';
import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/ui/bloc/language_bloc/language_bloc.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/routing/guards/onboarding_guard.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
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
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _createLanguageBloc(_dependenciesContainer.appConfigurationsStorage),
          ),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (_, state) => MaterialApp.router(
            locale: state.languageOption.toLocale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _router.config(navigatorObservers: () => [HeroController()]),
            theme: UiKitTheme.light,
          ),
        ),
      ),
    );
  }

  LanguageBloc _createLanguageBloc(AppConfigurationsStorage appConfigurationsStorage) {
    final appRepository = AppRepositoryImpl(
      localeService: LanguageService(appConfigurationsStorage: appConfigurationsStorage),
      themeService: ThemeService(appConfigurationsStorage: appConfigurationsStorage),
    );
    return LanguageBloc(
      getCurrentLanguageUseCase: GetCurrentLanguageUseCase(appRepository: appRepository),
      changeLanguageUseCase: ChangeLanguageUseCase(repository: appRepository),
    );
  }
}
