import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/use_cases/language/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/language/get_current_language_use_case.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';

class ChangeLanguageUseCaseMock extends Mock implements ChangeLanguageUseCase {}

class GetCurrentLanguageUseCaseMock extends Mock implements GetCurrentLanguageUseCase {}

void main() {
  late ChangeLanguageUseCaseMock changeLanguageUseCase;
  late GetCurrentLanguageUseCaseMock getCurrentLanguageUseCase;

  setUp(() {
    changeLanguageUseCase = ChangeLanguageUseCaseMock();
    getCurrentLanguageUseCase = GetCurrentLanguageUseCaseMock();
  });

  group('LanguageBloc', () {
    blocTest<LanguageBloc, LanguageState>(
      'emits initial state from GetCurrentLanguageUseCase',
      build: () {
        when(() => getCurrentLanguageUseCase.getCurrentLanguage()).thenReturn(LanguageOption.english);
        return LanguageBloc(
          getCurrentLanguageUseCase: getCurrentLanguageUseCase,
          changeLanguageUseCase: changeLanguageUseCase,
        );
      },
      verify: (bloc) {
        expect(bloc.state, const LanguageState.success(languageOption: LanguageOption.english));
      },
    );

    blocTest<LanguageBloc, LanguageState>(
      'emits [idle, success] when languageChanged succeeds',
      build: () {
        when(() => getCurrentLanguageUseCase.getCurrentLanguage()).thenReturn(LanguageOption.english);
        when(() => changeLanguageUseCase.changeLanguage(languageOption: LanguageOption.german))
            .thenAnswer((_) async {});
        return LanguageBloc(
          getCurrentLanguageUseCase: getCurrentLanguageUseCase,
          changeLanguageUseCase: changeLanguageUseCase,
        );
      },
      act: (bloc) => bloc.add(
        const LanguageEvent.languageChanged(languageOption: LanguageOption.german),
      ),
      expect: () => [
        const LanguageState.idle(),
        const LanguageState.success(languageOption: LanguageOption.german),
      ],
      verify: (_) {
        verify(() => changeLanguageUseCase.changeLanguage(languageOption: LanguageOption.german)).called(1);
      },
    );

    blocTest<LanguageBloc, LanguageState>(
      'adds error when changeLanguage throws',
      build: () {
        when(() => getCurrentLanguageUseCase.getCurrentLanguage()).thenReturn(LanguageOption.english);
        when(() => changeLanguageUseCase.changeLanguage(languageOption: LanguageOption.french))
            .thenThrow(Exception('fail'));
        return LanguageBloc(
          getCurrentLanguageUseCase: getCurrentLanguageUseCase,
          changeLanguageUseCase: changeLanguageUseCase,
        );
      },
      act: (bloc) => bloc.add(
        const LanguageEvent.languageChanged(languageOption: LanguageOption.french),
      ),
      expect: () => [
        const LanguageState.idle(),
      ],
      errors: () => [isA<Exception>()],
    );
  });
}
