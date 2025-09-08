import 'package:shared_preferences/shared_preferences.dart';
import 'package:taro/core/utils/is_generic_type_nullable.dart';
import 'package:tarot_logger/logger.dart';

part 'implementations/shared_preferences_storage.dart';

abstract interface class AppConfigurationsStorage {
  bool get isOnboardingCompleted;
  String? get selectedLocaleCode;

  Future<void> setOnboardingCompleted({required bool value});
  Future<void> setSelectedLocaleCode({required String localeCode});

  Future<void> clear();
}
