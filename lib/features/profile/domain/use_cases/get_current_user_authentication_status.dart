import 'package:taro/features/profile/domain/entities/user_authentication_status.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class GetCurrentUserAuthenticationStatus {
  final ProfileRepository _profileRepository;

  GetCurrentUserAuthenticationStatus({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  UserAuthenticationStatus getCurrentUserAuthenticationStatus() {
    return _profileRepository.getUserAuthenticationStatus();
  }
}
