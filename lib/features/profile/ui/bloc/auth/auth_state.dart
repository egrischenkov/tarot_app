part of 'auth_bloc.dart';

typedef AuthStateMatch<T, S extends AuthState> = T Function(S state);

sealed class AuthState extends Equatable {
  const AuthState();

  UserAuthenticationStatus get authStatus => maybeMap(
        success: (state) => state.authStatus,
        orElse: () => UserAuthenticationStatus.unauthenticated,
      );

  const factory AuthState.error() = AuthState$Error;

  const factory AuthState.loading() = AuthState$Loading;

  const factory AuthState.success({
    required UserAuthenticationStatus authStatus,
  }) = AuthState$Success;

  T map<T>({
    required AuthStateMatch<T, AuthState$Loading> loading,
    required AuthStateMatch<T, AuthState$Success> success,
    required AuthStateMatch<T, AuthState$Error> error,
  }) =>
      switch (this) {
        final AuthState$Loading state => loading(state),
        final AuthState$Success state => success(state),
        final AuthState$Error state => error(state),
      };

  T? mapOrNull<T>({
    AuthStateMatch<T, AuthState$Loading>? loading,
    AuthStateMatch<T, AuthState$Success>? success,
    AuthStateMatch<T, AuthState$Error>? error,
  }) =>
      map<T?>(
        loading: loading ?? (_) => null,
        success: success ?? (_) => null,
        error: error ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    AuthStateMatch<T, AuthState$Loading>? loading,
    AuthStateMatch<T, AuthState$Success>? success,
    AuthStateMatch<T, AuthState$Error>? error,
  }) =>
      map<T>(
        loading: loading ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );
}

/// States

final class AuthState$Loading extends AuthState {
  const AuthState$Loading();

  @override
  List<Object?> get props => [];
}

final class AuthState$Success extends AuthState {
  final UserAuthenticationStatus authStatus;

  const AuthState$Success({
    required this.authStatus,
  });

  @override
  List<Object?> get props => [authStatus];
}

final class AuthState$Error extends AuthState {
  const AuthState$Error();

  @override
  List<Object?> get props => [];
}
