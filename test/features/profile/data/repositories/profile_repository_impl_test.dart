import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/data/models/user_model.dart';
import 'package:taro/features/profile/data/repositories_implementations/profile_repository_impl.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';

import 'mocks.dart';

void main() {
  late ProfileRepositoryImpl repository;
  late ProfileDataSourceMock dataSource;

  setUp(() {
    registerFallbackValue(UserModelFake());

    dataSource = ProfileDataSourceMock();
    repository = ProfileRepositoryImpl(profileDataSource: dataSource);
  });

  group('getUserAuthenticationStatus', () {
    test('returns authenticated if dataSource returns true', () {
      when(() => dataSource.getIsUserAuthenticated()).thenReturn(true);

      final status = repository.getUserAuthenticationStatus();

      expect(status, UserAuthenticationStatus.authenticated);
      verify(() => dataSource.getIsUserAuthenticated()).called(1);
    });

    test('returns unauthenticated if dataSource returns false', () {
      when(() => dataSource.getIsUserAuthenticated()).thenReturn(false);

      final status = repository.getUserAuthenticationStatus();

      expect(status, UserAuthenticationStatus.unauthenticated);
      verify(() => dataSource.getIsUserAuthenticated()).called(1);
    });
  });

  group('setUserAuthenticationStatus', () {
    test('calls dataSource with true for authenticated', () async {
      when(() => dataSource.setUserAuthenticated(isAuthenticated: any(named: 'isAuthenticated')))
          .thenAnswer((_) async {});

      await repository.setUserAuthenticationStatus(status: UserAuthenticationStatus.authenticated);

      verify(() => dataSource.setUserAuthenticated(isAuthenticated: true)).called(1);
    });

    test('calls dataSource with false for unauthenticated', () async {
      when(() => dataSource.setUserAuthenticated(isAuthenticated: any(named: 'isAuthenticated')))
          .thenAnswer((_) async {});

      await repository.setUserAuthenticationStatus(status: UserAuthenticationStatus.unauthenticated);

      verify(() => dataSource.setUserAuthenticated(isAuthenticated: false)).called(1);
    });
  });

  group('getSavedUser', () {
    test('returns User if dataSource has saved user', () {
      const userModel = UserModel(email: 'test@example.com', name: 'Test User');
      when(() => dataSource.getSavedUserModel()).thenReturn(userModel);

      final user = repository.getSavedUser();

      expect(user, isA<User>());
      expect(user?.email, 'test@example.com');
      expect(user?.name, 'Test User');
    });

    test('returns null if no saved user', () {
      when(() => dataSource.getSavedUserModel()).thenReturn(null);

      final user = repository.getSavedUser();

      expect(user, isNull);
    });
  });

  group('saveUser', () {
    test('calls dataSource.setUser with correct UserModel', () async {
      const user = User(email: 'test@example.com', name: 'Test User');
      when(() => dataSource.setUser(userModel: any(named: 'userModel'))).thenAnswer((_) async {});

      await repository.saveUser(user: user);

      verify(
        () => dataSource.setUser(
          userModel: any(
            named: 'userModel',
            that: predicate<UserModel>((um) => um.email == 'test@example.com' && um.name == 'Test User'),
          ),
        ),
      ).called(1);
    });
  });

  group('deleteSavedUser', () {
    test('calls dataSource.deleteUser', () async {
      when(() => dataSource.deleteUser()).thenAnswer((_) async {});

      await repository.deleteSavedUser();

      verify(() => dataSource.deleteUser()).called(1);
    });
  });
}
