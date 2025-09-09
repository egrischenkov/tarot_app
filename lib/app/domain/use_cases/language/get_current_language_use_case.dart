import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class GetCurrentLanguageUseCase {
  final AppRepository _appRepository;

  GetCurrentLanguageUseCase({
    required AppRepository appRepository,
  }) : _appRepository = appRepository;

  LanguageOption getCurrentLanguage() {
    return _appRepository.getCurrentLanguageOption();
  }
}
