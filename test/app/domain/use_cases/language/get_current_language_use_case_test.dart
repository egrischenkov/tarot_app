import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';

import '../../../data/mocks.dart';

void main() {
  late AppRepositoryMock repositoryMock;
  late GetCurrentLanguageUseCase useCase;

  setUp(() {
    repositoryMock = AppRepositoryMock();
    useCase = GetCurrentLanguageUseCase(appRepository: repositoryMock);
  });

  group('GetCurrentLanguageUseCase', () {
    test('returns language from repository (english)', () {
      when(() => repositoryMock.getCurrentLanguageOption()).thenReturn(LanguageOption.english);

      final result = useCase.getCurrentLanguage();

      expect(result, LanguageOption.english);
      verify(() => repositoryMock.getCurrentLanguageOption()).called(1);
    });

    test('returns language from repository (russian)', () {
      when(() => repositoryMock.getCurrentLanguageOption()).thenReturn(LanguageOption.russian);

      final result = useCase.getCurrentLanguage();

      expect(result, LanguageOption.russian);
      verify(() => repositoryMock.getCurrentLanguageOption()).called(1);
    });
  });
}
