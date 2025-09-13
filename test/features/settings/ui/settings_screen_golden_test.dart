import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/features/settings/ui/settings_screen.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../app/data/mocks.dart';
import '../../../utils/golden_test_widget_wrapper.dart';

void main() {
  late final AppRepositoryMock appRepositoryMock;
  late final ThemeBloc themeBloc;
  late final LanguageBloc languageBloc;

  setUpAll(() {
    appRepositoryMock = AppRepositoryMock();

    when(() => appRepositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.dark);
    when(() => appRepositoryMock.getCurrentLanguageOption()).thenReturn(LanguageOption.chinese);

    themeBloc = ThemeBloc(
      getCurrentThemeUseCase: GetCurrentThemeUseCase(appRepository: appRepositoryMock),
      changeThemeUseCase: ChangeThemeUseCase(appRepository: appRepositoryMock),
    );
    languageBloc = LanguageBloc(
      getCurrentLanguageUseCase: GetCurrentLanguageUseCase(appRepository: appRepositoryMock),
      changeLanguageUseCase: ChangeLanguageUseCase(appRepository: appRepositoryMock),
    );
  });

  group('Settings screen golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'settings_screen_light_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: themeBloc),
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.lightThemeData,
        child: const SettingsScreen(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'settings_screen_dark_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => GoldenTestWidgetWrapper(
        providers: [
          BlocProvider.value(value: themeBloc),
          BlocProvider.value(value: languageBloc),
        ],
        themeData: UiKitTheme.darkThemeData,
        child: const SettingsScreen(),
      ),
    );
  });
}
