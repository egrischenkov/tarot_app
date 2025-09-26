import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/use_cases/get_saved_user_use_case.dart';

import 'mocks.dart';

void main() {
  late GetSavedUserUseCase useCase;
  late ProfileRepositoryMock repository;

  setUp(() {
    repository = ProfileRepositoryMock();
    useCase = GetSavedUserUseCase(profileRepository: repository);
  });

  test('returns saved user from repository', () {
    const user = User(email: 'test@example.com', name: 'Test User');

    when(() => repository.getSavedUser()).thenReturn(user);

    final result = useCase.getSavedUser();

    expect(result, user);
    verify(() => repository.getSavedUser()).called(1);
  });

  test('returns null if repository has no saved user', () {
    when(() => repository.getSavedUser()).thenReturn(null);

    final result = useCase.getSavedUser();

    expect(result, isNull);
    verify(() => repository.getSavedUser()).called(1);
  });

  test('propagates exception from repository', () {
    when(() => repository.getSavedUser()).thenThrow(Exception('Failed'));

    expect(() => useCase.getSavedUser(), throwsA(isA<Exception>()));
  });
}
