import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/use_cases/save_user_use_case.dart';

import 'mocks.dart';

void main() {
  late SaveUserUseCase useCase;
  late ProfileRepositoryMock repository;

  setUpAll(() {
    registerFallbackValue(FakeUser());
  });

  setUp(() {
    repository = ProfileRepositoryMock();
    useCase = SaveUserUseCase(profileRepository: repository);
  });

  test('calls repository.saveUser with correct user', () async {
    const user = User(email: 'test@example.com', name: 'Test User');

    when(() => repository.saveUser(user: any(named: 'user'))).thenAnswer((_) async {});

    await useCase.saveUser(user: user);

    verify(() => repository.saveUser(user: user)).called(1);
  });

  test('propagates exception from repository', () async {
    const user = User(email: 'fail@example.com', name: 'Fail');

    when(() => repository.saveUser(user: any(named: 'user'))).thenThrow(Exception('Failed'));

    expect(() => useCase.saveUser(user: user), throwsA(isA<Exception>()));
  });
}
