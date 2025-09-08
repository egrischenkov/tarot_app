import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/use_cases/change_language_use_case.dart';
import 'package:taro/app/domain/use_cases/get_current_language_use_case.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  final ChangeLanguageUseCase _changeLanguageUseCase;

  LanguageBloc({
    required GetCurrentLanguageUseCase getCurrentLanguageUseCase,
    required ChangeLanguageUseCase changeLanguageUseCase,
  })  : _changeLanguageUseCase = changeLanguageUseCase,
        super(
          LanguageState.success(
            languageOption: getCurrentLanguageUseCase.getCurrentLanguage(),
          ),
        ) {
    on<LanguageEvent>(
      (event, emit) => event.map(
        languageChanged: (event) => _onLanguageChanged(event, emit),
      ),
    );
  }

  Future<void> _onLanguageChanged(
    LanguageEvent$LanguageChanged event,
    Emitter<LanguageState> emit,
  ) async {
    try {
      emit(const LanguageState.idle());

      await _changeLanguageUseCase.changeLanguage(languageOption: event.languageOption);

      emit(LanguageState.success(languageOption: event.languageOption));
    } catch (e, s) {
      addError(e, s);
    }
  }
}
