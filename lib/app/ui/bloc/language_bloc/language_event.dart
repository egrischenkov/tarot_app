part of 'language_bloc.dart';

typedef LanguageEventMatch<T, S extends LanguageEvent> = T Function(S event);

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  const factory LanguageEvent.start() = LanguageEventStart;

  T map<T>({
    required LanguageEventMatch<T, LanguageEventStart> start,
  }) =>
      switch (this) {
        final LanguageEventStart event => start(event),
      };
}

final class LanguageEventStart extends LanguageEvent {
  const LanguageEventStart();

  @override
  List<Object?> get props => [];
}
