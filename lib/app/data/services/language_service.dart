import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

class LanguageService {
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
  final String _platformLanguageCode;
  late String currentLocaleCode;

  /// @nodoc
  LanguageService({
    required AppConfigurationsStorage appConfigurationsStorage,
    required String platformLanguageCode,
  })  : _appConfigurationsStorage = appConfigurationsStorage,
        _platformLanguageCode = platformLanguageCode {
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

    return isLocaleHasBeenSelectedByUser ? currentLocaleCode : _platformLanguageCode;
  }
}
