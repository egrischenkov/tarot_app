import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';

import 'mocks.dart';

void main() {
  late SetCurrentUserAuthenticationStatusUseCase useCase;
  late ProfileRepositoryMock repository;

  setUp(() {
    registerFallbackValue(UserAuthenticationStatus.authenticated);

    repository = ProfileRepositoryMock();
    useCase = SetCurrentUserAuthenticationStatusUseCase(profileRepository: repository);
  });

  test('calls repository with correct authentication status', () async {
    when(() => repository.setUserAuthenticationStatus(status: any(named: 'status'))).thenAnswer((_) async {});

    await useCase.setCurrentUserAuthenticationStatus(
      status: UserAuthenticationStatus.authenticated,
    );

    verify(
      () => repository.setUserAuthenticationStatus(
        status: UserAuthenticationStatus.authenticated,
      ),
    ).called(1);
  });

  test('propagates exception from repository', () async {
    when(() => repository.setUserAuthenticationStatus(status: any(named: 'status'))).thenThrow(Exception('Failed'));

    expect(
      () => useCase.setCurrentUserAuthenticationStatus(
        status: UserAuthenticationStatus.unauthenticated,
      ),
      throwsA(isA<Exception>()),
    );
  });
}
