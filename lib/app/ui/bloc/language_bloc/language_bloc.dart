import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taro/app/domain/entities/language_option.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc({
    required LanguageOption languageOption,
  }) : super(LanguageState.success(languageOption: languageOption)) {
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

      emit(LanguageState.success(languageOption: event.languageOption));
    } catch (e, s) {
      addError(e, s);
    }
  }
}
