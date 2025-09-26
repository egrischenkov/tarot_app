import 'package:mocktail/mocktail.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryMock extends Mock implements ProfileRepository {}

// ignore: avoid_implementing_value_types
class FakeUser extends Fake implements User {}
