import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class GetCurrentThemeUseCase {
  final AppRepository _appRepository;

  const GetCurrentThemeUseCase({
    required AppRepository appRepository,
  }) : _appRepository = appRepository;

  ThemeOption getCurrentThemeOption() {
    return _appRepository.getCurrentThemeOption();
  }
}
