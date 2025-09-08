import 'dart:io';
import 'dart:ui';

import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

final class LocaleService {
  final AppConfigurationsStorage _appConfigurationsStorage;

  late Locale currentLocale;

  /// @nodoc
  LocaleService({required AppConfigurationsStorage appConfigurationsStorage})
      : _appConfigurationsStorage = appConfigurationsStorage {
    currentLocale = _getCurrentLocale();
  }

  Future<void> selectNewLocale(Locale selectedLocale) {
    currentLocale = selectedLocale;
    return _saveLocaleToPreferences(selectedLocale);
  }

  Future<void> _saveLocaleToPreferences(Locale locale) {
    return _appConfigurationsStorage.setSelectedLocaleCode(localeCode: locale.languageCode);
  }

  Locale _getCurrentLocale() {
    final currentLocaleCode = _appConfigurationsStorage.selectedLocaleCode;
    final isLocaleHasBeenSelectedByUser = currentLocaleCode != null;

    return Locale(
      isLocaleHasBeenSelectedByUser ? currentLocaleCode : Platform.localeName,
    );
  }
}
