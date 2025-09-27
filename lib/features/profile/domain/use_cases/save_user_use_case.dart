import 'package:taro/features/profile/domain/entities/user.dart';
import 'package:taro/features/profile/domain/repositories/profile_repository.dart';

class SaveUserUseCase {
  final ProfileRepository _profileRepository;

  SaveUserUseCase({
    required ProfileRepository profileRepository,
  }) : _profileRepository = profileRepository;

  Future<void> saveUser({required User user}) {
    return _profileRepository.saveUser(user: user);
  }
}
