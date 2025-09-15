import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';

import '../../../data/mocks.dart';

void main() {
  late AppRepositoryMock repositoryMock;
  late ChangeThemeUseCase useCase;

  setUp(() {
    repositoryMock = AppRepositoryMock();
    useCase = ChangeThemeUseCase(appRepository: repositoryMock);
  });

  group('ChangeThemeUseCase', () {
    test('calls repository.setCurrentThemeOption with given theme', () async {
      const theme = ThemeOption.dark;
      when(() => repositoryMock.setCurrentThemeOption(themeOption: theme)).thenAnswer((_) async => {});

      await useCase.changeTheme(themeOption: theme);

      verify(() => repositoryMock.setCurrentThemeOption(themeOption: theme)).called(1);
    });

    test('propagates exception from repository', () async {
      const theme = ThemeOption.light;
      when(() => repositoryMock.setCurrentThemeOption(themeOption: theme)).thenThrow(Exception('failed'));

      expect(
        () => useCase.changeTheme(themeOption: theme),
        throwsA(isA<Exception>()),
      );
    });
  });
}
