import 'dart:convert';

import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:taro/features/profile/data/models/user_model.dart';

class ProfileDataSource {
  final AppConfigurationsStorage _appConfigurationsStorage;

  const ProfileDataSource({
    required AppConfigurationsStorage appConfigurationsStorage,
  }) : _appConfigurationsStorage = appConfigurationsStorage;

  bool getIsUserAuthenticated() {
    return _appConfigurationsStorage.isUserAuthenticated;
  }

  Future<void> setUserAuthenticated({required bool isAuthenticated}) {
    return _appConfigurationsStorage.setUserAuthenticated(
      value: isAuthenticated,
    );
  }

  UserModel? getSavedUserModel() {
    final userJsonString = _appConfigurationsStorage.user;

    if (userJsonString == null) {
      return null;
    }

    final userJson = jsonDecode(userJsonString) as Map<String, dynamic>;

    return UserModel.fromJson(userJson);
  }

  Future<void> setUser({required UserModel userModel}) {
    final userJson = userModel.toJson();
    final userJsonString = jsonEncode(userJson);

    return _appConfigurationsStorage.setUser(user: userJsonString);
  }

  Future<void> deleteUser() {
    return _appConfigurationsStorage.removeUser();
  }
}
