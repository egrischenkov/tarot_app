part of 'theme_bloc.dart';

typedef ThemeStateMatch<T, S extends ThemeState> = T Function(S state);

sealed class ThemeState extends Equatable {
  const ThemeState();

  const factory ThemeState.loading() = ThemeStateLoading;

  const factory ThemeState.success({
    required Object data,
  }) = ThemeStateSuccess;

  const factory ThemeState.error() = ThemeStateError;

  T map<T>({
    required ThemeStateMatch<T, ThemeStateLoading> loading,
    required ThemeStateMatch<T, ThemeStateSuccess> success,
    required ThemeStateMatch<T, ThemeStateError> error,
  }) =>
      switch (this) {
        final ThemeStateLoading state => loading(state),
        final ThemeStateSuccess state => success(state),
        final ThemeStateError state => error(state),
      };

  T? mapOrNull<T>({
    ThemeStateMatch<T, ThemeStateLoading>? loading,
    ThemeStateMatch<T, ThemeStateSuccess>? success,
    ThemeStateMatch<T, ThemeStateError>? error,
  }) =>
      map<T?>(
        loading: loading ?? (_) => null,
        success: success ?? (_) => null,
        error: error ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    ThemeStateMatch<T, ThemeStateLoading>? loading,
    ThemeStateMatch<T, ThemeStateSuccess>? success,
    ThemeStateMatch<T, ThemeStateError>? error,
  }) =>
      map<T>(
        loading: loading ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );
}

/// States

final class ThemeStateLoading extends ThemeState {
  const ThemeStateLoading();

  @override
  List<Object?> get props => [];
}

final class ThemeStateSuccess extends ThemeState {
  final Object data;

  const ThemeStateSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

final class ThemeStateError extends ThemeState {
  const ThemeStateError();

  @override
  List<Object?> get props => [];
}
