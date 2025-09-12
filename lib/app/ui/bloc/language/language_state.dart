part of 'language_bloc.dart';

typedef LanguageStateMatch<T, S extends LanguageState> = T Function(S state);

sealed class LanguageState extends Equatable {
  const LanguageState();

  LanguageOption get languageOption => maybeMap(
        success: (state) => state.languageOption,
        orElse: () => LanguageOption.english,
      );

  const factory LanguageState.idle() = LanguageState$Idle;

  const factory LanguageState.success({
    required LanguageOption languageOption,
  }) = LanguageState$Success;

  T map<T>({
    required LanguageStateMatch<T, LanguageState$Idle> idle,
    required LanguageStateMatch<T, LanguageState$Success> success,
  }) =>
      switch (this) {
        final LanguageState$Idle state => idle(state),
        final LanguageState$Success state => success(state),
      };

  T? mapOrNull<T>({
    LanguageStateMatch<T, LanguageState$Idle>? idle,
    LanguageStateMatch<T, LanguageState$Success>? success,
  }) =>
      map<T?>(
        idle: idle ?? (_) => null,
        success: success ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    LanguageStateMatch<T, LanguageState$Idle>? idle,
    LanguageStateMatch<T, LanguageState$Success>? success,
  }) =>
      map<T>(
        idle: idle ?? (_) => orElse(),
        success: success ?? (_) => orElse(),
      );
}

/// States

final class LanguageState$Idle extends LanguageState {
  const LanguageState$Idle();

  @override
  List<Object?> get props => [];
}

final class LanguageState$Success extends LanguageState {
  @override
  final LanguageOption languageOption;

  const LanguageState$Success({
    required this.languageOption,
  });

  @override
  List<Object?> get props => [languageOption];
}
