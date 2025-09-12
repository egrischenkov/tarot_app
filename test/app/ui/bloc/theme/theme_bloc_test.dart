import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';

class ChangeThemeUseCaseMock extends Mock implements ChangeThemeUseCase {}

class GetCurrentThemeUseCaseMock extends Mock implements GetCurrentThemeUseCase {}

void main() {
  late ChangeThemeUseCaseMock changeThemeUseCase;
  late GetCurrentThemeUseCaseMock getCurrentThemeUseCase;

  setUp(() {
    changeThemeUseCase = ChangeThemeUseCaseMock();
    getCurrentThemeUseCase = GetCurrentThemeUseCaseMock();
  });

  group('ThemeBloc', () {
    blocTest<ThemeBloc, ThemeState>(
      'emits initial state from GetCurrentThemeUseCase',
      build: () {
        when(() => getCurrentThemeUseCase.getCurrentThemeOption()).thenReturn(ThemeOption.dark);
        return ThemeBloc(
          getCurrentThemeUseCase: getCurrentThemeUseCase,
          changeThemeUseCase: changeThemeUseCase,
        );
      },
      verify: (bloc) {
        expect(bloc.state, const ThemeState.success(themeOption: ThemeOption.dark));
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'emits [idle, success] when themeChanged succeeds',
      build: () {
        when(() => getCurrentThemeUseCase.getCurrentThemeOption()).thenReturn(ThemeOption.light);
        when(() => changeThemeUseCase.changeTheme(themeOption: ThemeOption.dark)).thenAnswer((_) async {});
        return ThemeBloc(
          getCurrentThemeUseCase: getCurrentThemeUseCase,
          changeThemeUseCase: changeThemeUseCase,
        );
      },
      act: (bloc) => bloc.add(
        const ThemeEvent.themeChanged(themeOption: ThemeOption.dark),
      ),
      expect: () => [
        const ThemeState.idle(),
        const ThemeState.success(themeOption: ThemeOption.dark),
      ],
      verify: (_) {
        verify(() => changeThemeUseCase.changeTheme(themeOption: ThemeOption.dark)).called(1);
      },
    );

    blocTest<ThemeBloc, ThemeState>(
      'adds error when changeTheme throws',
      build: () {
        when(() => getCurrentThemeUseCase.getCurrentThemeOption()).thenReturn(ThemeOption.system);
        when(
          () => changeThemeUseCase.changeTheme(themeOption: ThemeOption.system),
        ).thenThrow(Exception('fail'));
        return ThemeBloc(
          getCurrentThemeUseCase: getCurrentThemeUseCase,
          changeThemeUseCase: changeThemeUseCase,
        );
      },
      act: (bloc) => bloc.add(
        const ThemeEvent.themeChanged(themeOption: ThemeOption.system),
      ),
      expect: () => [
        const ThemeState.idle(),
      ],
      errors: () => [isA<Exception>()],
    );
  });
}
