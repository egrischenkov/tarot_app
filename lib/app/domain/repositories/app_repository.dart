import 'package:taro/app/domain/entities/language_option.dart';

abstract interface class AppRepository {
  LanguageOption getCurrentLanguageOption();

  Future<void> setCurrentLanguage({required LanguageOption languageOption});
}
