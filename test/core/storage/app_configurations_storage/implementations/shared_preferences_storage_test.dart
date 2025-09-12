import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:tarot_logger/logger.dart';

part 'mocks.dart';

void main() {
  late SharedPreferencesMock sharedPreferencesMock;
  late SharedPreferencesStorage sharedPreferencesStorage;
  late LoggerMock loggerMock;

  setUp(() {
    sharedPreferencesMock = SharedPreferencesMock();
    loggerMock = LoggerMock();

    sharedPreferencesStorage = SharedPreferencesStorage(
      sharedPreferences: sharedPreferencesMock,
      logger: loggerMock,
    );
  });

  group('SharedPreferencesStorage', () {
    test('isOnboardingCompleted returns true', () {
      when(() => sharedPreferencesMock.getBool('is_onboarding_completed')).thenReturn(true);

      final result = sharedPreferencesStorage.isOnboardingCompleted;

      expect(result, isTrue);
    });

    test('isOnboardingCompleted returns default false', () {
      when(() => sharedPreferencesMock.getBool('is_onboarding_completed')).thenReturn(null);

      final result = sharedPreferencesStorage.isOnboardingCompleted;

      expect(result, isFalse);
    });

    test('setOnboardingCompleted success', () async {
      when(() => sharedPreferencesMock.setBool('is_onboarding_completed', true)).thenAnswer((_) async => true);

      await sharedPreferencesStorage.setOnboardingCompleted(value: true);

      verify(() => sharedPreferencesMock.setBool('is_onboarding_completed', true)).called(1);
    });

    test('setOnboardingCompleted logs on failure', () async {
      when(() => sharedPreferencesMock.setBool(any(), any())).thenThrow(Exception('fail'));

      await sharedPreferencesStorage.setOnboardingCompleted(value: true);

      verify(
        () => loggerMock.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).called(1);
    });

    test('selectedLocaleCode returns stored value', () {
      when(() => sharedPreferencesMock.get('selected_language_option')).thenReturn('en');

      final result = sharedPreferencesStorage.selectedLocaleCode;

      expect(result, 'en');
    });

    test('selectedLocaleCode returns null if not set', () {
      when(() => sharedPreferencesMock.get('selected_language_option')).thenReturn(null);

      final result = sharedPreferencesStorage.selectedLocaleCode;

      expect(result, isNull);
    });

    test('selectedTheme returns stored value', () {
      when(() => sharedPreferencesMock.getString('selectedTheme')).thenReturn('dark');

      final result = sharedPreferencesStorage.selectedTheme;

      expect(result, 'dark');
    });

    test('selectedTheme returns systemThemeKey by default', () {
      when(() => sharedPreferencesMock.getString('selectedTheme')).thenReturn(null);

      final result = sharedPreferencesStorage.selectedTheme;

      expect(result, AppConfigurationsStorage.systemThemeKey);
    });

    test('setSelectedLocaleCode success', () async {
      when(() => sharedPreferencesMock.setString('selected_language_option', 'en')).thenAnswer((_) async => true);

      await sharedPreferencesStorage.setSelectedLocaleCode(localeCode: 'en');

      verify(() => sharedPreferencesMock.setString('selected_language_option', 'en')).called(1);
    });

    test('setSelectedLocaleCode logs on failure', () async {
      when(() => sharedPreferencesMock.setString(any(), any())).thenThrow(Exception('fail'));

      await sharedPreferencesStorage.setSelectedLocaleCode(localeCode: 'en');

      verify(
        () => loggerMock.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).called(1);
    });

    test('setSelectedTheme success', () async {
      when(() => sharedPreferencesMock.setString('selectedTheme', 'light')).thenAnswer((_) async => true);

      await sharedPreferencesStorage.setSelectedTheme(theme: 'light');

      verify(() => sharedPreferencesMock.setString('selectedTheme', 'light')).called(1);
    });

    test('setSelectedTheme logs on failure', () async {
      when(() => sharedPreferencesMock.setString(any(), any())).thenThrow(Exception('fail'));

      await sharedPreferencesStorage.setSelectedTheme(theme: 'light');

      verify(
        () => loggerMock.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).called(1);
    });

    test('clear success', () async {
      when(() => sharedPreferencesMock.clear()).thenAnswer((_) async => true);

      await sharedPreferencesStorage.clear();

      verify(() => sharedPreferencesMock.clear()).called(1);
    });

    test('clear logs on failure and rethrows', () async {
      when(() => sharedPreferencesMock.clear()).thenThrow(Exception('clear fail'));

      await expectLater(sharedPreferencesStorage.clear(), throwsA(isA<Exception>()));

      verify(
        () => loggerMock.error(
          any(),
          error: any(named: 'error'),
          stackTrace: any(named: 'stackTrace'),
        ),
      ).called(1);
    });
  });
}
