import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:tarot_logger/logger.dart';

part 'mocks.dart';

void main() {
  late final SharedPreferencesMock sharedPreferencesMock;
  late final SharedPreferencesStorage sharedPreferencesStorage;
  late final FakeLogger fakeLogger;

  setUpAll(() {
    sharedPreferencesMock = SharedPreferencesMock();
    fakeLogger = FakeLogger();

    sharedPreferencesStorage = SharedPreferencesStorage(
      sharedPreferences: sharedPreferencesMock,
      logger: fakeLogger,
    );
  });

  group(
    'SharedPreferencesStorage tests',
    () {
      test('isOnboardingCompleted is true', () async {
        when(() => sharedPreferencesMock.getBool('is_onboarding_completed')).thenReturn(true);

        final result = sharedPreferencesStorage.isOnboardingCompleted;

        expect(result, isTrue);
      });

      test('setIsOnboarding to true', () async {
        when(() => sharedPreferencesMock.setBool('is_onboarding_completed', true)).thenAnswer((_) async => true);

        await sharedPreferencesStorage.setOnboardingCompleted(value: true);

        verify(
          () => sharedPreferencesMock.setBool('is_onboarding_completed', true),
        ).called(1);
      });

      test('setIsOnboarding failed', () async {
        when(() => sharedPreferencesMock.setBool('is_onboarding_completed', true))
            .thenThrow((_) => Exception('Failed to set value'));

        await sharedPreferencesStorage.setOnboardingCompleted(value: true).catchError((error) {
          expect(error, isA<Exception>());
          expect(error.toString(), contains('Failed to set value'));
        });
      });
    },
  );
}
