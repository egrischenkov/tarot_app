import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class ChangeThemeUseCase {
  final AppRepository _appRepository;

  const ChangeThemeUseCase({
    required AppRepository appRepository,
  }) : _appRepository = appRepository;

  Future<void> changeTheme({required ThemeOption themeOption}) {
    return _appRepository.setCurrentThemeOption(themeOption: themeOption);
  }
}
