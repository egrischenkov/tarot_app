import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/data/data_sources/profile_data_source.dart';
import 'package:taro/features/profile/data/models/user_model.dart';

import 'mocks.dart';

void main() {
  late ProfileDataSource dataSource;
  late AppConfigurationsStorageMock storageMock;

  setUp(() {
    storageMock = AppConfigurationsStorageMock();
    dataSource = ProfileDataSource(appConfigurationsStorage: storageMock);
  });

  group('getIsUserAuthenticated', () {
    test('returns value from storage', () {
      when(() => storageMock.isUserAuthenticated).thenReturn(true);

      final result = dataSource.getIsUserAuthenticated();

      expect(result, true);
      verify(() => storageMock.isUserAuthenticated).called(1);
    });
  });

  group('setUserAuthenticated', () {
    test('calls storage.setUserAuthenticated with correct value', () async {
      when(() => storageMock.setUserAuthenticated(value: any(named: 'value'))).thenAnswer((_) async {});

      await dataSource.setUserAuthenticated(isAuthenticated: true);

      verify(() => storageMock.setUserAuthenticated(value: true)).called(1);
    });

    test('propagates exception from storage', () async {
      when(() => storageMock.setUserAuthenticated(value: any(named: 'value'))).thenThrow(Exception('Failed'));

      expect(() => dataSource.setUserAuthenticated(isAuthenticated: true), throwsA(isA<Exception>()));
    });
  });

  group('getSavedUserModel', () {
    test('returns null if storage.user is null', () {
      when(() => storageMock.user).thenReturn(null);

      final result = dataSource.getSavedUserModel();

      expect(result, isNull);
      verify(() => storageMock.user).called(1);
    });

    test('returns UserModel if storage.user has data', () {
      final userMap = {'name': 'John', 'email': 'john@example.com'};
      final userJson = jsonEncode(userMap);

      when(() => storageMock.user).thenReturn(userJson);

      final result = dataSource.getSavedUserModel();

      expect(result, isA<UserModel>());
      expect(result!.name, 'John');
      expect(result.email, 'john@example.com');
    });
  });

  group('setUser', () {
    test('calls storage.setUser with correct json string', () async {
      const userModel = UserModel(name: 'Alice', email: 'alice@example.com');

      when(() => storageMock.setUser(user: any(named: 'user'))).thenAnswer((_) async {});

      await dataSource.setUser(userModel: userModel);

      final expectedJson = jsonEncode(userModel.toJson());
      verify(() => storageMock.setUser(user: expectedJson)).called(1);
    });
  });

  group('deleteUser', () {
    test('calls storage.removeUser', () async {
      when(() => storageMock.removeUser()).thenAnswer((_) async {});

      await dataSource.deleteUser();

      verify(() => storageMock.removeUser()).called(1);
    });
  });
}
