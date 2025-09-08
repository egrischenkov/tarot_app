part of 'theme_bloc.dart';

typedef ThemeEventMatch<T, S extends ThemeEvent> = T Function(S event);

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  const factory ThemeEvent.start() = ThemeEventStart;

  T map<T>({
    required ThemeEventMatch<T, ThemeEventStart> start,
  }) =>
      switch (this) {
        final ThemeEventStart event => start(event),
      };
}

final class ThemeEventStart extends ThemeEvent {
  const ThemeEventStart();

  @override
  List<Object?> get props => [];
}
