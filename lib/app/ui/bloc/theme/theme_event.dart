part of 'theme_bloc.dart';

typedef ThemeEventMatch<T, S extends ThemeEvent> = T Function(S event);

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  const factory ThemeEvent.themeChanged({
    required ThemeOption themeOption,
  }) = ThemeEvent$ThemeChanged;

  T map<T>({
    required ThemeEventMatch<T, ThemeEvent$ThemeChanged> start,
  }) =>
      switch (this) {
        final ThemeEvent$ThemeChanged event => start(event),
      };
}

final class ThemeEvent$ThemeChanged extends ThemeEvent {
  final ThemeOption themeOption;

  const ThemeEvent$ThemeChanged({required this.themeOption});

  @override
  List<Object?> get props => [themeOption];
}
