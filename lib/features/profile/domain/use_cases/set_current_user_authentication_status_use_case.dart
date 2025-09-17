import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class SetCurrentUserAuthenticationStatusUseCase {
  final ProfileRepository _profileRepository;

  const SetCurrentUserAuthenticationStatusUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  Future<void> setCurrentUserAuthenticationStatus({required UserAuthenticationStatus status}) {
    return _profileRepository.setUserAuthenticationStatus(status: status);
  }
}
