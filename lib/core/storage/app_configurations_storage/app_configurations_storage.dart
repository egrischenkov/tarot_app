import 'package:shared_preferences/shared_preferences.dart';
import 'package:taro/core/utils/is_generic_type_nullable.dart';
import 'package:tarot_logger/logger.dart';

part 'implementations/shared_preferences_storage.dart';

abstract interface class AppConfigurationsStorage {
  static const systemThemeKey = 'system';
  static const lightThemeKey = 'light';
  static const darkThemeKey = 'dark';

  bool get isOnboardingCompleted;
  String? get selectedLocaleCode;
  String get selectedTheme;
  bool get isUserAuthenticated;
  String? get user;

  Future<void> setOnboardingCompleted({required bool value});
  Future<void> setSelectedLocaleCode({required String localeCode});
  Future<void> setSelectedTheme({required String theme});
  Future<void> setUserAuthenticated({required bool value});
  Future<void> setUser({required String user});
  Future<void> removeUser();

  Future<void> clear();
}
