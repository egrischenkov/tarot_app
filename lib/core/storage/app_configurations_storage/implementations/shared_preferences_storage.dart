part of '../app_configurations_storage.dart';

/// A concrete implementation of [AppConfigurationsStorage] using SharedPreferences.
/// This class provides methods to get and set application configuration values through SharedPreferences.
class SharedPreferencesStorage implements AppConfigurationsStorage {
  static const _isOnboardingCompleted = 'is_onboarding_completed';
  static const _selectedLanguageOption = 'selected_language_option';
  static const _selectedTheme = 'selectedTheme';
  static const _isUserAuthenticated = 'is_user_authenticated';

  final SharedPreferences _sharedPreferences;
  final Logger _logger;

  SharedPreferencesStorage({
    required SharedPreferences sharedPreferences,
    required Logger logger,
  })  : _sharedPreferences = sharedPreferences,
        _logger = logger;

  @override
  bool get isOnboardingCompleted => _getRemotePrimitiveValue<bool>(
        keyName: _isOnboardingCompleted,
        defaultValue: false,
      );

  @override
  String? get selectedLocaleCode => _getRemotePrimitiveValue<String?>(
        keyName: _selectedLanguageOption,
        defaultValue: null,
      );

  @override
  String get selectedTheme => _getRemotePrimitiveValue<String>(
        keyName: _selectedTheme,
        defaultValue: AppConfigurationsStorage.systemThemeKey,
      );

  @override
  bool get isUserAuthenticated => _getRemotePrimitiveValue<bool>(
        keyName: _isUserAuthenticated,
        defaultValue: false,
      );

  @override
  Future<void> setOnboardingCompleted({required bool value}) async {
    try {
      await _sharedPreferences.setBool(_isOnboardingCompleted, value);
    } catch (e, s) {
      _logger.error(
        'Failed to set $_isOnboardingCompleted in SharedPreferences',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> setSelectedLocaleCode({required String localeCode}) async {
    try {
      await _sharedPreferences.setString(_selectedLanguageOption, localeCode);
    } catch (e, s) {
      _logger.error(
        'Failed to set $_selectedLanguageOption in SharedPreferences',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> setSelectedTheme({required String theme}) async {
    try {
      await _sharedPreferences.setString(_selectedTheme, theme);
    } catch (e, s) {
      _logger.error(
        'Failed to set $_selectedTheme in SharedPreferences',
        error: e,
        stackTrace: s,
      );
    }
  }

  @override
  Future<void> setUserAuthenticated({required bool value}) async {
    try {
      await _sharedPreferences.setBool(_isUserAuthenticated, value);
    } catch (e, s) {
      _logger.error(
        'Failed to set $_isUserAuthenticated in SharedPreferences',
        error: e,
        stackTrace: s,
      );
    }
  }

  /// Get [bool], [String], [double], [int] value from SharedPreferences.
  T _getRemotePrimitiveValue<T>({
    required String keyName,
    required T defaultValue,
  }) {
    try {
      if (isGenericTypeNullable<T>()) {
        return _sharedPreferences.get(keyName) as T;
      }

      if (T == bool) {
        return (_sharedPreferences.getBool(keyName) ?? defaultValue) as T;
      }

      if (T == String) {
        return (_sharedPreferences.getString(keyName) ?? defaultValue) as T;
      }

      if (T == int) {
        return (_sharedPreferences.getInt(keyName) ?? defaultValue) as T;
      }

      if (T == double) {
        return (_sharedPreferences.getDouble(keyName) ?? defaultValue) as T;
      }

      throw UnsupportedError('Unsupported type: $T');
    } catch (e, s) {
      _logger.error(
        'Failed to get $keyName from SharedPreferences',
        error: e,
        stackTrace: s,
      );

      return defaultValue;
    }
  }

  @override
  Future<void> clear() {
    try {
      return _sharedPreferences.clear();
    } catch (e, s) {
      _logger.error(
        'Failed to clear SharedPreferences',
        error: e,
        stackTrace: s,
      );
      return Future.error(e, s);
    }
  }
}
