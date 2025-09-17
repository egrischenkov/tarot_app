part of 'auth_bloc.dart';

typedef AuthEventMatch<T, S extends AuthEvent> = T Function(S event);

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  const factory AuthEvent.loggedIn() = AuthEvent$LoggedIn;

  const factory AuthEvent.loggedOut() = AuthEvent$LoggedOut;

  T map<T>({
    required AuthEventMatch<T, AuthEvent$LoggedIn> loggedIn,
    required AuthEventMatch<T, AuthEvent$LoggedOut> loggedOut,
  }) =>
      switch (this) {
        final AuthEvent$LoggedIn event => loggedIn(event),
        final AuthEvent$LoggedOut event => loggedOut(event),
      };
}

final class AuthEvent$LoggedIn extends AuthEvent {
  const AuthEvent$LoggedIn();

  @override
  List<Object?> get props => [];
}

final class AuthEvent$LoggedOut extends AuthEvent {
  const AuthEvent$LoggedOut();

  @override
  List<Object?> get props => [];
}
