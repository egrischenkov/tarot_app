import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';

import '../../../data/mocks.dart';

void main() {
  late AppRepositoryMock repositoryMock;
  late GetCurrentThemeUseCase useCase;

  setUp(() {
    repositoryMock = AppRepositoryMock();
    useCase = GetCurrentThemeUseCase(appRepository: repositoryMock);
  });

  group('GetCurrentThemeUseCase', () {
    test('returns current theme from repository (dark)', () {
      when(() => repositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.dark);

      final result = useCase.getCurrentThemeOption();

      expect(result, ThemeOption.dark);
      verify(() => repositoryMock.getCurrentThemeOption()).called(1);
    });

    test('returns current theme from repository (light)', () {
      when(() => repositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.light);

      final result = useCase.getCurrentThemeOption();

      expect(result, ThemeOption.light);
      verify(() => repositoryMock.getCurrentThemeOption()).called(1);
    });

    test('returns current theme from repository (system)', () {
      when(() => repositoryMock.getCurrentThemeOption()).thenReturn(ThemeOption.system);

      final result = useCase.getCurrentThemeOption();

      expect(result, ThemeOption.system);
      verify(() => repositoryMock.getCurrentThemeOption()).called(1);
    });
  });
}
