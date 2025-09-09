import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class ChangeLanguageUseCase {
  final AppRepository _repository;

  ChangeLanguageUseCase({
    required AppRepository appRepository,
  }) : _repository = appRepository;

  Future<void> changeLanguage({required LanguageOption languageOption}) {
    return _repository.setCurrentLanguage(languageOption: languageOption);
  }
}
