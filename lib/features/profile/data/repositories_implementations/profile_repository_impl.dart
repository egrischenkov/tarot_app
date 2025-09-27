import 'package:taro/features/profile/data/data_sources/profile_data_source.dart';
import 'package:taro/features/profile/data/models/user_model.dart';
import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource _profileDataSource;

  const ProfileRepositoryImpl({
    required ProfileDataSource profileDataSource,
  }) : _profileDataSource = profileDataSource;

  @override
  UserAuthenticationStatus getUserAuthenticationStatus() {
    return _profileDataSource.getIsUserAuthenticated()
        ? UserAuthenticationStatus.authenticated
        : UserAuthenticationStatus.unauthenticated;
  }

  @override
  Future<void> setUserAuthenticationStatus({required UserAuthenticationStatus status}) {
    return _profileDataSource.setUserAuthenticated(
      isAuthenticated: switch (status) {
        UserAuthenticationStatus.authenticated => true,
        UserAuthenticationStatus.unauthenticated => false,
      },
    );
  }

  @override
  User? getSavedUser() {
    return _profileDataSource.getSavedUserModel()?._toUser;
  }

  @override
  Future<void> saveUser({required User user}) {
    return _profileDataSource.setUser(userModel: user._toUserModel);
  }

  @override
  Future<void> deleteSavedUser() {
    return _profileDataSource.deleteUser();
  }
}

extension on UserModel {
  User get _toUser {
    return User(
      email: email,
      name: name,
      birthDate: birthDate,
      job: job,
      gender: gender,
      maritalStatus: maritalStatus,
    );
  }
}

extension on User {
  UserModel get _toUserModel {
    return UserModel(
      email: email,
      name: name,
      birthDate: birthDate,
      job: job,
      gender: gender,
      maritalStatus: maritalStatus,
    );
  }
}
