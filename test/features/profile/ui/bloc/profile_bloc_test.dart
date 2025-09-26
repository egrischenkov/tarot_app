import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/ui/bloc/profile_bloc.dart';

import 'mocks.dart';

void main() {
  late SetAuthStatusUseCaseMock setAuthStatus;
  late GetAuthStatusUseCaseMock getAuthStatus;
  late SaveUserUseCaseMock saveUser;
  late GetSavedUserUseCaseMock getSavedUser;
  late DeleteSavedUserUseCaseMock deleteSavedUser;

  setUp(() {
    registerFallbackValue(FakeUser());

    setAuthStatus = SetAuthStatusUseCaseMock();
    getAuthStatus = GetAuthStatusUseCaseMock();
    saveUser = SaveUserUseCaseMock();
    getSavedUser = GetSavedUserUseCaseMock();
    deleteSavedUser = DeleteSavedUserUseCaseMock();
  });

  group('ProfileBloc', () {
    blocTest<ProfileBloc, ProfileState>(
      'emits [loading, authenticated] on LoggedIn',
      build: () {
        when(() => getAuthStatus.getCurrentUserAuthenticationStatus())
            .thenReturn(UserAuthenticationStatus.unauthenticated);
        when(() => getSavedUser.getSavedUser()).thenReturn(null);
        when(
          () => setAuthStatus.setCurrentUserAuthenticationStatus(
            status: UserAuthenticationStatus.authenticated,
          ),
        ).thenAnswer((_) async {});
        when(() => saveUser.saveUser(user: any(named: 'user'))).thenAnswer((_) async {});
        return ProfileBloc(
          setAuthStatusUseCase: setAuthStatus,
          getAuthStatusUseCase: getAuthStatus,
          saveUserUseCase: saveUser,
          getSavedUserUseCase: getSavedUser,
          deleteSavedUserUseCase: deleteSavedUser,
        );
      },
      act: (bloc) => bloc.add(
        const ProfileEvent.loggedIn(email: 'test@test.com', password: '123'),
      ),
      wait: const Duration(seconds: 4),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.authenticated(
          user: User(email: 'test@test.com', name: 'test@test.com'),
        ),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits [loading, idle] on LoggedOut',
      build: () {
        when(() => getAuthStatus.getCurrentUserAuthenticationStatus())
            .thenReturn(UserAuthenticationStatus.authenticated);
        when(() => getSavedUser.getSavedUser()).thenReturn(const User(email: 'saved@test.com', name: 'saved'));
        when(
          () => setAuthStatus.setCurrentUserAuthenticationStatus(
            status: UserAuthenticationStatus.unauthenticated,
          ),
        ).thenAnswer((_) async {});
        when(() => deleteSavedUser.deleteSavedUser()).thenAnswer((_) async {});
        return ProfileBloc(
          setAuthStatusUseCase: setAuthStatus,
          getAuthStatusUseCase: getAuthStatus,
          saveUserUseCase: saveUser,
          getSavedUserUseCase: getSavedUser,
          deleteSavedUserUseCase: deleteSavedUser,
        );
      },
      act: (bloc) => bloc.add(const ProfileEvent.loggedOut()),
      wait: const Duration(seconds: 4),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.idle(),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits [loading, authenticated] on Confirmed',
      build: () {
        when(() => getAuthStatus.getCurrentUserAuthenticationStatus())
            .thenReturn(UserAuthenticationStatus.unauthenticated);
        when(() => getSavedUser.getSavedUser()).thenReturn(null);
        when(
          () => setAuthStatus.setCurrentUserAuthenticationStatus(
            status: UserAuthenticationStatus.authenticated,
          ),
        ).thenAnswer((_) async {});
        when(() => saveUser.saveUser(user: any(named: 'user'))).thenAnswer((_) async {});
        return ProfileBloc(
          setAuthStatusUseCase: setAuthStatus,
          getAuthStatusUseCase: getAuthStatus,
          saveUserUseCase: saveUser,
          getSavedUserUseCase: getSavedUser,
          deleteSavedUserUseCase: deleteSavedUser,
        );
      },
      act: (bloc) => bloc.add(
        const ProfileEvent.confirmed(email: 'john@doe.com', name: 'John', code: '123'),
      ),
      wait: const Duration(seconds: 4),
      expect: () => [
        const ProfileState.loading(),
        const ProfileState.authenticated(
          user: User(email: 'john@doe.com', name: 'John'),
        ),
      ],
    );
  });
}
