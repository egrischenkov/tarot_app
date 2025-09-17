part of 'auth_bloc.dart';

typedef AuthEventMatch<T, S extends AuthEvent> = T Function(S event);

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  const factory AuthEvent.start() = AuthEventStart;

  T map<T>({
    required AuthEventMatch<T, AuthEventStart> start,
  }) =>
      switch (this) {
        final AuthEventStart event => start(event),
      };
}

final class AuthEventStart extends AuthEvent {
  const AuthEventStart();

  @override
  List<Object?> get props => [];
}
