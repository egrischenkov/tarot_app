import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';

import 'mocks.dart';

void main() {
  late GetCurrentUserAuthenticationStatus useCase;
  late ProfileRepositoryMock repository;

  setUp(() {
    repository = ProfileRepositoryMock();
    useCase = GetCurrentUserAuthenticationStatus(profileRepository: repository);
  });

  test('returns authentication status from repository', () {
    when(() => repository.getUserAuthenticationStatus()).thenReturn(UserAuthenticationStatus.authenticated);

    final status = useCase.getCurrentUserAuthenticationStatus();

    expect(status, UserAuthenticationStatus.authenticated);
    verify(() => repository.getUserAuthenticationStatus()).called(1);
  });

  test('propagates exception from repository', () {
    when(() => repository.getUserAuthenticationStatus()).thenThrow(Exception('Failed'));

    expect(() => useCase.getCurrentUserAuthenticationStatus(), throwsA(isA<Exception>()));
  });
}
