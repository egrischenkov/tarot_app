import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/data/repositories_implementations/app_repository_impl.dart';
import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/routing/guards/onboarding_guard.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class App extends StatefulWidget {
  final AppDependenciesContainer _dependenciesContainer;
  final AppRouter _router;
  final AppRepository _appRepository;

  App({
    required AppDependenciesContainer dependenciesContainer,
    super.key,
  })  : _dependenciesContainer = dependenciesContainer,
        _router = AppRouter(
          onboardingGuard: OnboardingGuard(
            sharedPreferencesStorage: dependenciesContainer.appConfigurationsStorage,
          ),
        ),
        _appRepository = AppRepositoryImpl(
          languageService: LanguageService(
            appConfigurationsStorage: dependenciesContainer.appConfigurationsStorage,
            platformLanguageCode: Platform.localeName,
          ),
          themeService: ThemeService(
            appConfigurationsStorage: dependenciesContainer.appConfigurationsStorage,
          ),
        );

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final ThemeBloc _themeBloc;
  late final LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();

    _themeBloc = _createThemeBloc();
    _languageBloc = _createLanguageBloc();
  }

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: widget._dependenciesContainer,
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: _themeBloc,
          ),
          BlocProvider.value(
            value: _languageBloc,
          ),
        ],
        child: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (_, languageState) => BlocBuilder<ThemeBloc, ThemeState>(
            builder: (_, themeState) {
              return MaterialApp.router(
                locale: Locale(languageState.languageOption.languageCode),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                routerConfig: widget._router.config(navigatorObservers: () => [HeroController()]),
                themeMode: ThemeMode.values.singleWhere(
                  (mode) {
                    return themeState.themeOption.name == mode.name;
                  },
                  orElse: () => ThemeMode.system,
                ),
                theme: UiKitTheme.lightThemeData,
                darkTheme: UiKitTheme.darkThemeData,
              );
            },
          ),
        ),
      ),
    );
  }

  LanguageBloc _createLanguageBloc() {
    return LanguageBloc(
      getCurrentLanguageUseCase: GetCurrentLanguageUseCase(appRepository: widget._appRepository),
      changeLanguageUseCase: ChangeLanguageUseCase(appRepository: widget._appRepository),
    );
  }

  ThemeBloc _createThemeBloc() {
    return ThemeBloc(
      getCurrentThemeUseCase: GetCurrentThemeUseCase(appRepository: widget._appRepository),
      changeThemeUseCase: ChangeThemeUseCase(appRepository: widget._appRepository),
    );
  }
}
