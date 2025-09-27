import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';

abstract interface class ProfileRepository {
  UserAuthenticationStatus getUserAuthenticationStatus();
  Future<void> setUserAuthenticationStatus({required UserAuthenticationStatus status});

  User? getSavedUser();
  Future<void> saveUser({required User user});

  Future<void> deleteSavedUser();
}
