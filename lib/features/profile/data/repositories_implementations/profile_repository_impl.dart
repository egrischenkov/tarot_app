import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final AppConfigurationsStorage _appConfigurationsStorage;

  ProfileRepositoryImpl({
    required AppConfigurationsStorage appConfigurationsStorage,
  }) : _appConfigurationsStorage = appConfigurationsStorage;

  @override
  UserAuthenticationStatus getUserAuthenticationStatus() {
    return _appConfigurationsStorage.isUserAuthenticated
        ? UserAuthenticationStatus.authenticated
        : UserAuthenticationStatus.unauthenticated;
  }

  @override
  Future<void> setUserAuthenticationStatus({required UserAuthenticationStatus status}) {
    return _appConfigurationsStorage.setUserAuthenticated(
      value: switch (status) {
        UserAuthenticationStatus.authenticated => true,
        UserAuthenticationStatus.unauthenticated => false,
      },
    );
  }
}
