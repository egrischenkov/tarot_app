import 'dart:io';

import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

final class LanguageService {
  static const russianLanguageCode = 'ru';
  static const englishLanguageCode = 'en';
  static const germanLanguageCode = 'de';
  static const spanishLanguageCode = 'es';
  static const frenchLanguageCode = 'fr';
  static const hindiLanguageCode = 'hi';
  static const italianLanguageCode = 'it';
  static const portugueseLanguageCode = 'pt';
  static const chineseLanguageCode = 'zh';

  final AppConfigurationsStorage _appConfigurationsStorage;
  late String currentLocaleCode;

  /// @nodoc
  LanguageService({required AppConfigurationsStorage appConfigurationsStorage})
      : _appConfigurationsStorage = appConfigurationsStorage {
    currentLocaleCode = _getCurrentLocale();
  }

  Future<void> selectNewLocale(String selectedLocaleCode) {
    currentLocaleCode = selectedLocaleCode;
    return _saveLocaleToPreferences(selectedLocaleCode);
  }

  Future<void> _saveLocaleToPreferences(String localeCode) {
    return _appConfigurationsStorage.setSelectedLocaleCode(localeCode: localeCode);
  }

  String _getCurrentLocale() {
    final currentLocaleCode = _appConfigurationsStorage.selectedLocaleCode;
    final isLocaleHasBeenSelectedByUser = currentLocaleCode != null;

    return isLocaleHasBeenSelectedByUser ? currentLocaleCode : Platform.localeName;
  }
}
