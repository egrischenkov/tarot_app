import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class GetSavedUserUseCase {
  final ProfileRepository _profileRepository;

  const GetSavedUserUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  User? getSavedUser() {
    return _profileRepository.getSavedUser();
  }
}
