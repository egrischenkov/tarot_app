import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/delete_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/get_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/save_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  static ProfileState _getInitialProfileState(
    UserAuthenticationStatus status,
    User? user,
  ) =>
      // We need to show user some info about user on profile screen if he is
      // authenticated. So we need to check if we have saved user data.
      // Other info we will get from backend when it will be ready.
      // So we will show skeleton while loading. For some info.
      status.isAuthenticated
          ? ProfileState.authenticated(
              user: user ?? User.empty(),
            )
          : const ProfileState.idle();

  final SetCurrentUserAuthenticationStatusUseCase _setAuthStatusUseCase;
  final SaveUserUseCase _saveUserUseCase;
  final DeleteSavedUserUseCase _deleteSavedUserUseCase;

  ProfileBloc({
    required SetCurrentUserAuthenticationStatusUseCase setAuthStatusUseCase,
    required GetCurrentUserAuthenticationStatus getAuthStatusUseCase,
    required SaveUserUseCase saveUserUseCase,
    required GetSavedUserUseCase getSavedUserUseCase,
    required DeleteSavedUserUseCase deleteSavedUserUseCase,
  })  : _setAuthStatusUseCase = setAuthStatusUseCase,
        _saveUserUseCase = saveUserUseCase,
        _deleteSavedUserUseCase = deleteSavedUserUseCase,
        super(
          _getInitialProfileState(
            getAuthStatusUseCase.getCurrentUserAuthenticationStatus(),
            getSavedUserUseCase.getSavedUser(),
          ),
        ) {
    on<ProfileEvent>(
      (event, emit) => event.map(
        loggedIn: (event) => _onLoggedIn(event, emit),
        loggedOut: (event) => _onLoggedOut(event, emit),
        signedUp: (event) => _onSingedUp(event, emit),
        deletedAccount: (event) => _onDeletedAccount(event, emit),
      ),
    );
  }

  Future<void> _onLoggedIn(
    ProfileEvent$LoggedIn event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileState.loading());

      // Simulates network request
      await Future.delayed(const Duration(seconds: 4));

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.authenticated,
      );

      // TODO(egrischenkov): refactor it when backend will be ready
      final user = User(email: event.email, name: event.email);
      await _saveUserUseCase.saveUser(
        user: user,
      );

      emit(ProfileState.authenticated(user: user));
    } catch (e, s) {
      addError(e, s);

      emit(const ProfileState.error());
    }
  }

  Future<void> _onLoggedOut(
    ProfileEvent$LoggedOut event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileState.loading());

      // Simulates network request
      await Future.delayed(const Duration(seconds: 4));

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.unauthenticated,
      );

      await _deleteSavedUserUseCase.deleteSavedUser();

      emit(const ProfileState.idle());
    } catch (e, s) {
      addError(e, s);

      emit(const ProfileState.error());
    }
  }

  Future<void> _onSingedUp(
    ProfileEvent$SignedUp event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileState.loading());

      // Simulates network request
      await Future.delayed(const Duration(seconds: 4));

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.authenticated,
      );

      // TODO(egrischenkov): refactor it when backend will be ready
      final user = User(email: event.email, name: event.name);
      await _saveUserUseCase.saveUser(
        user: user,
      );

      emit(ProfileState.authenticated(user: user));
    } catch (e, s) {
      addError(e, s);

      emit(const ProfileState.error());
    }
  }

  Future<void> _onDeletedAccount(
    ProfileEvent$DeletedAccount event,
    Emitter<ProfileState> emit,
  ) async {
    try {
      emit(const ProfileState.loading());

      await _setAuthStatusUseCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.unauthenticated,
      );
      await _deleteSavedUserUseCase.deleteSavedUser();

      emit(const ProfileState.idle());
    } catch (e, s) {
      addError(e, s);

      emit(const ProfileState.error());
    }
  }
}
