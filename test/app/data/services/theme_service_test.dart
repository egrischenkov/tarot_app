import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/data/services/theme_service.dart';

import '../mocks.dart';

void main() {
  late AppConfigurationsStorageMock storageMock;
  late ThemeService themeService;

  setUp(() {
    storageMock = AppConfigurationsStorageMock();
  });

  group('ThemeService', () {
    test('initializes with theme from storage', () {
      when(() => storageMock.selectedTheme).thenReturn(ThemeService.darkTheme);

      themeService = ThemeService(appConfigurationsStorage: storageMock);

      expect(themeService.currentThemeMode, ThemeService.darkTheme);
    });

    test('selectTheme does nothing if same theme selected', () async {
      when(() => storageMock.selectedTheme).thenReturn(ThemeService.lightTheme);
      themeService = ThemeService(appConfigurationsStorage: storageMock);

      await themeService.selectTheme(ThemeService.lightTheme);

      verifyNever(() => storageMock.setSelectedTheme(theme: any(named: 'theme')));
      expect(themeService.currentThemeMode, ThemeService.lightTheme);
    });

    test('selectTheme updates theme when different', () async {
      when(() => storageMock.selectedTheme).thenReturn(ThemeService.systemTheme);
      when(() => storageMock.setSelectedTheme(theme: any(named: 'theme'))).thenAnswer((_) async => {});
      themeService = ThemeService(appConfigurationsStorage: storageMock);

      await themeService.selectTheme(ThemeService.darkTheme);

      verify(() => storageMock.setSelectedTheme(theme: ThemeService.darkTheme)).called(1);
      expect(themeService.currentThemeMode, ThemeService.darkTheme);
    });
  });
}
