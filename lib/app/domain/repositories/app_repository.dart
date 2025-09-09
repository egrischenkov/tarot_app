import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';

abstract interface class AppRepository {
  LanguageOption getCurrentLanguageOption();
  Future<void> setCurrentLanguage({required LanguageOption languageOption});

  ThemeOption getCurrentThemeOption();
  Future<void> setCurrentThemeOption({required ThemeOption themeOption});
}
