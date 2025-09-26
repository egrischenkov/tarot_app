import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/use_cases/delete_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/get_current_user_authentication_status.dart';
import 'package:taro/features/profile/domain/use_cases/get_saved_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/save_user_use_case.dart';
import 'package:taro/features/profile/domain/use_cases/set_current_user_authentication_status_use_case.dart';

class SetAuthStatusUseCaseMock extends Mock implements SetCurrentUserAuthenticationStatusUseCase {}

class GetAuthStatusUseCaseMock extends Mock implements GetCurrentUserAuthenticationStatus {}

class SaveUserUseCaseMock extends Mock implements SaveUserUseCase {}

class GetSavedUserUseCaseMock extends Mock implements GetSavedUserUseCase {}

class DeleteSavedUserUseCaseMock extends Mock implements DeleteSavedUserUseCase {}

// ignore: avoid_implementing_value_types
class FakeUser extends Fake implements User {}
