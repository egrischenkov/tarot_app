part of 'profile_bloc.dart';

typedef ProfileEventMatch<T, S extends ProfileEvent> = T Function(S event);

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  const factory ProfileEvent.loggedIn({
    required String email,
    required String password,
  }) = ProfileEvent$LoggedIn;

  const factory ProfileEvent.loggedOut() = ProfileEvent$LoggedOut;

  const factory ProfileEvent.signedUp({
    required String email,
    required String password,
    required String name,
  }) = ProfileEvent$SignedUp;

  const factory ProfileEvent.deletedAccount() = ProfileEvent$DeletedAccount;

  T map<T>({
    required ProfileEventMatch<T, ProfileEvent$LoggedIn> loggedIn,
    required ProfileEventMatch<T, ProfileEvent$LoggedOut> loggedOut,
    required ProfileEventMatch<T, ProfileEvent$SignedUp> signedUp,
    required ProfileEventMatch<T, ProfileEvent$DeletedAccount> deletedAccount,
  }) =>
      switch (this) {
        final ProfileEvent$LoggedIn event => loggedIn(event),
        final ProfileEvent$LoggedOut event => loggedOut(event),
        final ProfileEvent$SignedUp event => signedUp(event),
        final ProfileEvent$DeletedAccount event => deletedAccount(event),
      };
}

final class ProfileEvent$LoggedIn extends ProfileEvent {
  final String email;
  final String password;

  const ProfileEvent$LoggedIn({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}

final class ProfileEvent$LoggedOut extends ProfileEvent {
  const ProfileEvent$LoggedOut();

  @override
  List<Object?> get props => [];
}

final class ProfileEvent$SignedUp extends ProfileEvent {
  final String email;
  final String password;
  final String name;

  const ProfileEvent$SignedUp({
    required this.email,
    required this.password,
    required this.name,
  });

  @override
  List<Object?> get props => [email, password];
}

final class ProfileEvent$DeletedAccount extends ProfileEvent {
  const ProfileEvent$DeletedAccount();

  @override
  List<Object?> get props => [];
}
