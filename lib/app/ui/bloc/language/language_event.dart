part of 'language_bloc.dart';

typedef LanguageEventMatch<T, S extends LanguageEvent> = T Function(S event);

sealed class LanguageEvent extends Equatable {
  const LanguageEvent();

  const factory LanguageEvent.languageChanged({
    required LanguageOption languageOption,
  }) = LanguageEvent$LanguageChanged;

  T map<T>({
    required LanguageEventMatch<T, LanguageEvent$LanguageChanged> languageChanged,
  }) =>
      switch (this) {
        final LanguageEvent$LanguageChanged event => languageChanged(event),
      };
}

final class LanguageEvent$LanguageChanged extends LanguageEvent {
  final LanguageOption languageOption;

  const LanguageEvent$LanguageChanged({required this.languageOption});

  @override
  List<Object?> get props => [languageOption];
}
