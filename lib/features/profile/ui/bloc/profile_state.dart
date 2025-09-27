part of 'profile_bloc.dart';

typedef ProfileStateMatch<T, S extends ProfileState> = T Function(S state);

sealed class ProfileState extends Equatable {
  const ProfileState();

  bool get isAuthenticated => maybeMap(
        authenticated: (_) => true,
        orElse: () => false,
      );

  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );

  const factory ProfileState.idle() = ProfileState$Idle;

  const factory ProfileState.error() = ProfileState$Error;

  const factory ProfileState.loading() = ProfileState$Loading;

  const factory ProfileState.authenticated({
    required User user,
  }) = ProfileState$Authenticated;

  T map<T>({
    required ProfileStateMatch<T, ProfileState$Idle> idle,
    required ProfileStateMatch<T, ProfileState$Loading> loading,
    required ProfileStateMatch<T, ProfileState$Authenticated> authenticated,
    required ProfileStateMatch<T, ProfileState$Error> error,
  }) =>
      switch (this) {
        final ProfileState$Idle state => idle(state),
        final ProfileState$Loading state => loading(state),
        final ProfileState$Authenticated state => authenticated(state),
        final ProfileState$Error state => error(state),
      };

  T? mapOrNull<T>({
    ProfileStateMatch<T, ProfileState$Idle>? idle,
    ProfileStateMatch<T, ProfileState$Loading>? loading,
    ProfileStateMatch<T, ProfileState$Authenticated>? authenticated,
    ProfileStateMatch<T, ProfileState$Error>? error,
  }) =>
      map<T?>(
        idle: idle ?? (_) => null,
        loading: loading ?? (_) => null,
        authenticated: authenticated ?? (_) => null,
        error: error ?? (_) => null,
      );

  T maybeMap<T>({
    required T Function() orElse,
    ProfileStateMatch<T, ProfileState$Idle>? idle,
    ProfileStateMatch<T, ProfileState$Loading>? loading,
    ProfileStateMatch<T, ProfileState$Authenticated>? authenticated,
    ProfileStateMatch<T, ProfileState$Error>? error,
  }) =>
      map<T>(
        idle: idle ?? (_) => orElse(),
        loading: loading ?? (_) => orElse(),
        authenticated: authenticated ?? (_) => orElse(),
        error: error ?? (_) => orElse(),
      );
}

/// States

final class ProfileState$Loading extends ProfileState {
  const ProfileState$Loading();

  @override
  List<Object?> get props => [];
}

final class ProfileState$Authenticated extends ProfileState {
  final User user;

  const ProfileState$Authenticated({
    required this.user,
  });

  @override
  List<Object?> get props => [
        user,
      ];
}

final class ProfileState$Error extends ProfileState {
  const ProfileState$Error();

  @override
  List<Object?> get props => [];
}

final class ProfileState$Idle extends ProfileState {
  const ProfileState$Idle();

  @override
  List<Object?> get props => [];
}
