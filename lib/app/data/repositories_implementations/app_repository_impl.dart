import 'dart:ui';

import 'package:taro/app/data/services/language_service.dart';
import 'package:taro/app/data/services/theme_service.dart';
import 'package:taro/app/domain/entities/language_option.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/domain/repositories/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  static const _russianLanguageCode = 'ru';
  static const _englishLanguageCode = 'en';
  static const _germanLanguageCode = 'de';
  static const _spanishLanguageCode = 'es';
  static const _frenchLanguageCode = 'fr';
  static const _hindiLanguageCode = 'hi';
  static const _italianLanguageCode = 'it';
  static const _portugueseLanguageCode = 'pt';
  static const _chineseLanguageCode = 'zh';

  final LanguageService _localeService;
  final ThemeService _themeService;

  AppRepositoryImpl({
    required LanguageService localeService,
    required ThemeService themeService,
  })  : _localeService = localeService,
        _themeService = themeService;

  @override
  LanguageOption getCurrentLanguageOption() {
    return _localeService.currentLocale._toLanguageOption;
  }

  @override
  Future<void> setCurrentLanguage({required LanguageOption languageOption}) {
    return _localeService.selectNewLocale(languageOption.toLocale);
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

// TODO(egrischenkov): need to refactor. Locale must be in the UI layer.
// So LanguageService also must be refactored.
// I think data layer must work only with String language code
extension LanguageOptionX on LanguageOption {
  Locale get toLocale {
    return switch (this) {
      LanguageOption.russian => const Locale(AppRepositoryImpl._russianLanguageCode),
      LanguageOption.english => const Locale(AppRepositoryImpl._englishLanguageCode),
      LanguageOption.german => const Locale(AppRepositoryImpl._germanLanguageCode),
      LanguageOption.spanish => const Locale(AppRepositoryImpl._spanishLanguageCode),
      LanguageOption.french => const Locale(AppRepositoryImpl._frenchLanguageCode),
      LanguageOption.hindi => const Locale(AppRepositoryImpl._hindiLanguageCode),
      LanguageOption.italian => const Locale(AppRepositoryImpl._italianLanguageCode),
      LanguageOption.portuguese => const Locale(AppRepositoryImpl._portugueseLanguageCode),
      LanguageOption.chinese => const Locale(AppRepositoryImpl._chineseLanguageCode),
    };
  }
}

extension on Locale {
  LanguageOption get _toLanguageOption {
    return switch (languageCode) {
      AppRepositoryImpl._russianLanguageCode => LanguageOption.russian,
      AppRepositoryImpl._englishLanguageCode => LanguageOption.english,
      AppRepositoryImpl._germanLanguageCode => LanguageOption.german,
      AppRepositoryImpl._spanishLanguageCode => LanguageOption.spanish,
      AppRepositoryImpl._frenchLanguageCode => LanguageOption.french,
      AppRepositoryImpl._hindiLanguageCode => LanguageOption.hindi,
      AppRepositoryImpl._italianLanguageCode => LanguageOption.italian,
      AppRepositoryImpl._portugueseLanguageCode => LanguageOption.portuguese,
      AppRepositoryImpl._chineseLanguageCode => LanguageOption.chinese,
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
