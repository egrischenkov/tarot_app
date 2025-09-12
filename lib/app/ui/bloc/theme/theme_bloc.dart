import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/use_cases/theme/change_theme_use_case.dart';
import 'package:taro/app/domain/use_cases/theme/get_current_theme_use_case.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ChangeThemeUseCase _changeThemeUseCase;

  ThemeBloc({
    required GetCurrentThemeUseCase getCurrentThemeUseCase,
    required ChangeThemeUseCase changeThemeUseCase,
  })  : _changeThemeUseCase = changeThemeUseCase,
        super(
          ThemeState.success(
            themeOption: getCurrentThemeUseCase.getCurrentThemeOption(),
          ),
        ) {
    on<ThemeEvent>(
      (event, emit) => event.map(
        start: (event) => _onThemeChanged(event, emit),
      ),
    );
  }

  Future<void> _onThemeChanged(
    ThemeEvent$ThemeChanged event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      emit(const ThemeState.idle());

      await _changeThemeUseCase.changeTheme(themeOption: event.themeOption);

      emit(ThemeState.success(themeOption: event.themeOption));
    } catch (e, s) {
      addError(e, s);
    }
  }
}
