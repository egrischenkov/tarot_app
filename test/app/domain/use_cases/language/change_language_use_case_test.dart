import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';

import '../../../data/mocks.dart';

void main() {
  late AppRepositoryMock repositoryMock;
  late ChangeLanguageUseCase useCase;

  setUp(() {
    repositoryMock = AppRepositoryMock();
    useCase = ChangeLanguageUseCase(appRepository: repositoryMock);
  });

  group('ChangeLanguageUseCase', () {
    test('calls repository.setCurrentLanguage with given option', () async {
      const option = LanguageOption.english;
      when(() => repositoryMock.setCurrentLanguage(languageOption: option)).thenAnswer((_) async => {});

      await useCase.changeLanguage(languageOption: option);

      verify(() => repositoryMock.setCurrentLanguage(languageOption: option)).called(1);
    });

    test('propagates exception from repository', () async {
      const option = LanguageOption.russian;
      when(() => repositoryMock.setCurrentLanguage(languageOption: option)).thenThrow(Exception('failed'));

      expect(
        () => useCase.changeLanguage(languageOption: option),
        throwsA(isA<Exception>()),
      );
    });
  });
}
