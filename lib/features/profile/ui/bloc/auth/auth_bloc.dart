import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SetCurrentUserAuthenticationStatusUseCase _setAuthStatusUseCase;

  AuthBloc({
    required SetCurrentUserAuthenticationStatusUseCase setAuthStatusUseCase,
    required GetCurrentUserAuthenticationStatus getAuthStatusUseCase,
  })  : _setAuthStatusUseCase = setAuthStatusUseCase,
        super(
          AuthState.success(
            authStatus: getAuthStatusUseCase.getCurrentUserAuthenticationStatus(),
          ),
        ) {
    on<AuthEvent>(
      (event, emit) => event.map(
        loggedIn: (event) => _onLoggedIn(event, emit),
        loggedOut: (event) => _onLoggedOut(event, emit),
      ),
    );
  }

  Future<void> _onLoggedIn(
    AuthEvent$LoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      // Simulates network request
      await Future.delayed(const Duration(seconds: 4));

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.authenticated,
      );

      emit(const AuthState.success(authStatus: UserAuthenticationStatus.authenticated));
    } catch (e, s) {
      addError(e, s);

      emit(const AuthState.error());
    }
  }

  Future<void> _onLoggedOut(
    AuthEvent$LoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(const AuthState.loading());

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.unauthenticated,
      );

      emit(const AuthState.success(authStatus: UserAuthenticationStatus.unauthenticated));
    } catch (e, s) {
      addError(e, s);

      emit(const AuthState.error());
    }
  }
}
