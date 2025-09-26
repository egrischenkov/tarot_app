import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/use_cases/delete_saved_user_use_case.dart';

import 'mocks.dart';

void main() {
  late DeleteSavedUserUseCase useCase;
  late ProfileRepositoryMock repository;

  setUp(() {
    repository = ProfileRepositoryMock();
    useCase = DeleteSavedUserUseCase(profileRepository: repository);
  });

  test('calls repository.deleteSavedUser', () async {
    when(() => repository.deleteSavedUser()).thenAnswer((_) async {});

    await useCase.deleteSavedUser();

    verify(() => repository.deleteSavedUser()).called(1);
  });

  test('propagates exception from repository', () async {
    when(() => repository.deleteSavedUser()).thenThrow(Exception('Failed'));

    expect(() => useCase.deleteSavedUser(), throwsA(isA<Exception>()));
  });
}
