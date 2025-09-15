import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final LanguageService _languageService;
  final ThemeService _themeService;

  AppRepositoryImpl({
    required LanguageService languageService,
    required ThemeService themeService,
  })  : _languageService = languageService,
        _themeService = themeService;

  @override
  LanguageOption getCurrentLanguageOption() {
    return _languageService.currentLocaleCode._toLanguageOption;
  }

  @override
  Future<void> setCurrentLanguage({required LanguageOption languageOption}) {
    return _languageService.selectNewLocale(languageOption.languageCode);
  }

  @override
  ThemeOption getCurrentThemeOption() {
    return _themeService.currentThemeMode._toThemeOption;
  }

  @override
  Future<void> setCurrentThemeOption({required ThemeOption themeOption}) {
    return _themeService.selectTheme(themeOption.name);
  }
}

extension on String {
  LanguageOption get _toLanguageOption {
    return switch (this) {
      LanguageService.russianLanguageCode => LanguageOption.russian,
      LanguageService.englishLanguageCode => LanguageOption.english,
      LanguageService.germanLanguageCode => LanguageOption.german,
      LanguageService.spanishLanguageCode => LanguageOption.spanish,
      LanguageService.frenchLanguageCode => LanguageOption.french,
      LanguageService.hindiLanguageCode => LanguageOption.hindi,
      LanguageService.italianLanguageCode => LanguageOption.italian,
      LanguageService.portugueseLanguageCode => LanguageOption.portuguese,
      LanguageService.chineseLanguageCode => LanguageOption.chinese,
      _ => LanguageOption.english,
    };
  }
}

extension on String {
  ThemeOption get _toThemeOption {
    return switch (this) {
      ThemeService.systemTheme => ThemeOption.system,
      ThemeService.lightTheme => ThemeOption.light,
      ThemeService.darkTheme => ThemeOption.dark,
      _ => ThemeOption.light,
    };
  }
}
