import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';

/// A service that stores and retrieves app theme mode.
class ThemeService {
  static const systemTheme = AppConfigurationsStorage.systemThemeKey;
  static const lightTheme = AppConfigurationsStorage.lightThemeKey;
  static const darkTheme = AppConfigurationsStorage.darkThemeKey;

  final AppConfigurationsStorage _appConfigurationsStorage;

  late String currentThemeMode;

  /// Creates instance of [ThemeService] with preferences - [AppConfigurationsStorage].
  ThemeService({required AppConfigurationsStorage appConfigurationsStorage})
      : _appConfigurationsStorage = appConfigurationsStorage {
    currentThemeMode = _getCurrentTheme();
  }

  Future<void> selectTheme(String selectedThemeMode) async {
    if (currentThemeMode == selectedThemeMode) {
      return;
    }

    currentThemeMode = selectedThemeMode;
    return _appConfigurationsStorage.setSelectedTheme(theme: selectedThemeMode);
  }

  String _getCurrentTheme() {
    return _appConfigurationsStorage.selectedTheme;
  }
}
