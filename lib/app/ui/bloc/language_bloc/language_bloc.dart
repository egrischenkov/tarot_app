import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState.loading()) {
    on<LanguageEvent>(
      (event, emit) => event.map(
        start: (event) => _onStart(event, emit),
      ),
    );
  }

  Future<void> _onStart(
    LanguageEventStart event,
    Emitter<LanguageState> emit,
  ) async {
    try {
      emit(const LanguageState.loading());

      // do something

      emit(const LanguageState.success(data: Object()));
    } catch (e, s) {
      addError(e, s);

      emit(const LanguageState.error());
    }
  }
}
