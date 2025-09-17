import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.loading()) {
    on<AuthEvent>(
      (event, emit) => event.map(
        start: (event) => _onStart(event, emit),
      ),
    );
  }

  Future<void> _onStart(
    AuthEventStart event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      // do something

      emit(const AuthState.success(data: Object()));
    } catch (e, s) {
      addError(e, s);

      emit(const AuthState.error());
    }
  }
}
