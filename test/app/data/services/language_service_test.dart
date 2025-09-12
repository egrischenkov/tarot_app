import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/data/services/language_service.dart';

import '../mocks.dart';

void main() {
  late AppConfigurationsStorageMock storageMock;

  setUp(() {
    storageMock = AppConfigurationsStorageMock();
  });

  group('LanguageService', () {
    test('initializes with saved locale from storage', () {
      when(() => storageMock.selectedLocaleCode).thenReturn(LanguageService.germanLanguageCode);

      final service = LanguageService(
        appConfigurationsStorage: storageMock,
        platformLanguageCode: LanguageService.englishLanguageCode,
      );

      expect(service.currentLocaleCode, LanguageService.germanLanguageCode);
    });

    test('initializes with platform language if no saved locale', () {
      when(() => storageMock.selectedLocaleCode).thenReturn(null);

      final service = LanguageService(
        appConfigurationsStorage: storageMock,
        platformLanguageCode: LanguageService.spanishLanguageCode,
      );

      expect(service.currentLocaleCode, LanguageService.spanishLanguageCode);
    });

    test('selectNewLocale updates currentLocaleCode and saves to storage', () async {
      when(() => storageMock.selectedLocaleCode).thenReturn(null);
      when(() => storageMock.setSelectedLocaleCode(localeCode: any(named: 'localeCode'))).thenAnswer((_) async => {});
      final service = LanguageService(
        appConfigurationsStorage: storageMock,
        platformLanguageCode: LanguageService.englishLanguageCode,
      );

      await service.selectNewLocale(LanguageService.frenchLanguageCode);

      expect(service.currentLocaleCode, LanguageService.frenchLanguageCode);
      verify(() => storageMock.setSelectedLocaleCode(localeCode: LanguageService.frenchLanguageCode)).called(1);
    });
  });
}
