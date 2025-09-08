part of 'language_bloc.dart';

typedef LanguageStateMatch<T, S extends LanguageState> = T Function(S state);

sealed class LanguageState extends Equatable {
  const LanguageState();

  const factory LanguageState.loading() = LanguageStateLoading;

  const factory LanguageState.success({
    required Object data,
  }) = LanguageStateSuccess;

  const factory LanguageState.error() = LanguageStateError;

  T map<T>({
    required LanguageStateMatch<T, LanguageStateLoading> loading,
    required LanguageStateMatch<T, LanguageStateSuccess> success,
    required LanguageStateMatch<T, LanguageStateError> error,
  }) =>
      switch (this) {
        final LanguageStateLoading state => loading(state),
        final LanguageStateSuccess state => success(state),
        final LanguageStateError state => error(state),
      };

  T? mapOrNull<T>({
    LanguageStateMatch<T, LanguageStateLoading>? loading,
    LanguageStateMatch<T, LanguageStateSuccess>? success,
    LanguageStateMatch<T, LanguageStateError>? error,
  }) =>
      map<T?>(
        loading: loading ?? (_) => null,
        success: success ?? (_) => null,
        error: error ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    LanguageStateMatch<T, LanguageStateLoading>? loading,
    LanguageStateMatch<T, LanguageStateSuccess>? success,
    LanguageStateMatch<T, LanguageStateError>? error,
  }) =>
      map<T>(
        loading: loading ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );
}

/// States

final class LanguageStateLoading extends LanguageState {
  const LanguageStateLoading();

  @override
  List<Object?> get props => [];
}

final class LanguageStateSuccess extends LanguageState {
  final Object data;

  const LanguageStateSuccess({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}

final class LanguageStateError extends LanguageState {
  const LanguageStateError();

  @override
  List<Object?> get props => [];
}
