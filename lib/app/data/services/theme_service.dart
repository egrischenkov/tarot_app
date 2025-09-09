import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService {
  static const systemTheme = 'system';
  static const lightTheme = 'light';
  static const darkTheme = 'dark';

  final AppConfigurationsStorage _appConfigurationsStorage;

  late String currentThemeMode;

  /// Creates instance of [ThemeService] with preferences - [AppConfigurationsStorage].
  ThemeService({required AppConfigurationsStorage appConfigurationsStorage})
      : _appConfigurationsStorage = appConfigurationsStorage {
    currentThemeMode = _getCurrentTheme();
  }

  void selectTheme(String selectedThemeMode) {
    if (currentThemeMode == selectedThemeMode) {
      return;
    }

    currentThemeMode = selectedThemeMode;
    _appConfigurationsStorage.setSelectedTheme(theme: selectedThemeMode);
  }

  String _getCurrentTheme() {
    return _appConfigurationsStorage.selectedTheme;
  }
}
