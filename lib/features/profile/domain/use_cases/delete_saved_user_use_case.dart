import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class DeleteSavedUserUseCase {
  final ProfileRepository _profileRepository;

  const DeleteSavedUserUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  Future<void> deleteSavedUser() {
    return _profileRepository.deleteSavedUser();
  }
}
