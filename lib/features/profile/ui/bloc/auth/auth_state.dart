part of 'auth_bloc.dart';

typedef AuthStateMatch<T, S extends AuthState> = T Function(S state);

sealed class AuthState extends Equatable {
  const AuthState();

  const factory AuthState.loading() = AuthStateLoading;

  const factory AuthState.success({
    required Object data,
  }) = AuthStateSuccess;

  const factory AuthState.error() = AuthStateError;

  T map<T>({
    required AuthStateMatch<T, AuthStateLoading> loading,
    required AuthStateMatch<T, AuthStateSuccess> success,
    required AuthStateMatch<T, AuthStateError> error,
  }) =>
      switch (this) {
        final AuthStateLoading state => loading(state),
        final AuthStateSuccess state => success(state),
        final AuthStateError state => error(state),
      };

  T? mapOrNull<T>({
    AuthStateMatch<T, AuthStateLoading>? loading,
    AuthStateMatch<T, AuthStateSuccess>? success,
    AuthStateMatch<T, AuthStateError>? error,
  }) =>
      map<T?>(
        loading: loading ?? (_) => null,
        success: success ?? (_) => null,
        error: error ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    AuthStateMatch<T, AuthStateLoading>? loading,
    AuthStateMatch<T, AuthStateSuccess>? success,
    AuthStateMatch<T, AuthStateError>? error,
  }) =>
      map<T>(
        loading: loading ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );
}

/// States

final class AuthStateLoading extends AuthState {
  const AuthStateLoading();

  @override
  List<Object?> get props => [];
}

final class AuthStateSuccess extends AuthState {
  final Object data;

  const AuthStateSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

final class AuthStateError extends AuthState {
  const AuthStateError();

  @override
  List<Object?> get props => [];
}
