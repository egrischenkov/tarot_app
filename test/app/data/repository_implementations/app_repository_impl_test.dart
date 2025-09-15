import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/data/repositories_implementations/app_repository_impl.dart';
import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:tarot_logger/logger.dart';

import '../../../core/storage/app_configurations_storage/implementations/shared_preferences_storage_test.dart';
import '../mocks.dart';

void main() {
  (
    AppRepositoryImpl,
    ThemeService,
    LanguageService,
    AppConfigurationsStorageMock,
  ) customSetUp({
    String themeKey = 'light',
    String platformLanguageCode = 'en',
    String? selectedLanguageCode,
  }) {
    final appConfigurationsStorageMock = AppConfigurationsStorageMock();
    when(() {
      return appConfigurationsStorageMock.selectedTheme;
    }).thenReturn(themeKey);
    when(() {
      return appConfigurationsStorageMock.selectedLocaleCode;
    }).thenReturn(selectedLanguageCode);

    final themeService = ThemeService(appConfigurationsStorage: appConfigurationsStorageMock);
    final languageService = LanguageService(
      appConfigurationsStorage: appConfigurationsStorageMock,
      platformLanguageCode: platformLanguageCode,
    );

    final appRepositoryImpl = AppRepositoryImpl(
      languageService: languageService,
      themeService: themeService,
    );

    return (appRepositoryImpl, themeService, languageService, appConfigurationsStorageMock);
  }

  group(
    'AppRepositoryImpl tests',
    () {
      test('Get Platform language if language hasn\'t been selected', () {
        final preparedEntities = customSetUp(
          platformLanguageCode: LanguageOption.french.languageCode,
          selectedLanguageCode: null,
        );

        final selectedLanguageOption = preparedEntities.$1.getCurrentLanguageOption();

        expect(selectedLanguageOption, LanguageOption.french);
      });

      test('Get already selected language', () {
        final preparedEntities = customSetUp(
          selectedLanguageCode: LanguageOption.russian.languageCode,
        );
        final appRepositoryImpl = preparedEntities.$1;

        final selectedLanguageOption = appRepositoryImpl.getCurrentLanguageOption();

        expect(selectedLanguageOption, LanguageOption.russian);
      });

      test('Select new language', () async {
        final languageServiceMock = LanguageServiceMock();
        final themeServiceMock = ThemeServiceMock();
        final appRepositoryImpl = AppRepositoryImpl(
          languageService: languageServiceMock,
          themeService: themeServiceMock,
        );
        when(() => languageServiceMock.selectNewLocale(any())).thenAnswer((_) async {});

        await appRepositoryImpl.setCurrentLanguage(languageOption: LanguageOption.chinese);

        verify(
          () => languageServiceMock.selectNewLocale(LanguageOption.chinese.languageCode),
        ).called(1);
      });

      test('Get Platform theme if theme hasn\'t been selected', () {
        final languageServiceMock = LanguageServiceMock();
        final sharedPreferencesMock = SharedPreferencesMock();
        final themeService = ThemeService(
          appConfigurationsStorage: SharedPreferencesStorage(
            sharedPreferences: sharedPreferencesMock,
            logger: FakeLogger(),
          ),
        );
        final appRepositoryImpl = AppRepositoryImpl(
          languageService: languageServiceMock,
          themeService: themeService,
        );
        when(() => sharedPreferencesMock.getString('selectedTheme')).thenReturn(null);

        final currentThemeOption = appRepositoryImpl.getCurrentThemeOption();

        expect(currentThemeOption, ThemeOption.system);
      });

      test('Get already selected theme', () {
        final preparedEntities = customSetUp(
          themeKey: ThemeOption.dark.name,
        );
        final appRepositoryImpl = preparedEntities.$1;

        final selectedThemeOption = appRepositoryImpl.getCurrentThemeOption();

        expect(selectedThemeOption, ThemeOption.dark);
      });

      test('Select new theme', () async {
        final languageServiceMock = LanguageServiceMock();
        final themeServiceMock = ThemeServiceMock();
        final appRepositoryImpl = AppRepositoryImpl(
          languageService: languageServiceMock,
          themeService: themeServiceMock,
        );
        when(() => themeServiceMock.selectTheme(any())).thenAnswer((_) async {});

        await appRepositoryImpl.setCurrentThemeOption(themeOption: ThemeOption.dark);

        verify(
          () => themeServiceMock.selectTheme(ThemeOption.dark.name),
        ).called(1);
      });
    },
  );
}
