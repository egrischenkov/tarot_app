part of 'theme_bloc.dart';

typedef ThemeStateMatch<T, S extends ThemeState> = T Function(S state);

sealed class ThemeState extends Equatable {
  const ThemeState();

  const factory ThemeState.idle() = ThemeState$Idle;

  const factory ThemeState.success({
    required ThemeOption themeOption,
  }) = ThemeState$Success;

  T map<T>({
    required ThemeStateMatch<T, ThemeState$Idle> idle,
    required ThemeStateMatch<T, ThemeState$Success> success,
  }) =>
      switch (this) {
        final ThemeState$Idle state => idle(state),
        final ThemeState$Success state => success(state),
      };

  T? mapOrNull<T>({
    ThemeStateMatch<T, ThemeState$Idle>? idle,
    ThemeStateMatch<T, ThemeState$Success>? success,
  }) =>
      map<T?>(
        idle: idle ?? (_) => null,
        success: success ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    ThemeStateMatch<T, ThemeState$Idle>? idle,
    ThemeStateMatch<T, ThemeState$Success>? success,
  }) =>
      map<T>(
        idle: idle ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
      );
}

/// States

final class ThemeState$Idle extends ThemeState {
  const ThemeState$Idle();

  @override
  List<Object?> get props => [];
}

final class ThemeState$Success extends ThemeState {
  final ThemeOption themeOption;

  const ThemeState$Success({
    required this.themeOption,
  });

  @override
  List<Object?> get props => [themeOption];
}
