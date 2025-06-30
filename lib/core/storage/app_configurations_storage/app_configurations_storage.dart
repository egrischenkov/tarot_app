import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarot_logger/logger.dart';

part 'implementations/shared_preferences_storage.dart';

abstract interface class AppConfigurationsStorage {
  bool get isOnboardingCompleted;
  Future<void> setOnboardingCompleted({required bool value});
  Future<void> clear();
}
