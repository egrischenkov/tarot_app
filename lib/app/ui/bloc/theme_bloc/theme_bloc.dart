import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const ThemeState.loading()) {
    on<ThemeEvent>(
      (event, emit) => event.map(
        start: (event) => _onStart(event, emit),
      ),
    );
  }

  Future<void> _onStart(
    ThemeEventStart event,
    Emitter<ThemeState> emit,
  ) async {
    try {
      emit(const ThemeState.loading());

      // do something

      emit(const ThemeState.success(data: Object()));
    } catch (e, s) {
      addError(e, s);

      emit(const ThemeState.error());
    }
  }
}
