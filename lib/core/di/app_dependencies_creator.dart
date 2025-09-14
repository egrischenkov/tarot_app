import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/app_runner/flavor.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/storage/app_configurations_storage/app_configurations_storage.dart';
import 'package:taro/core/utils/device_info_service.dart';
import 'package:taro/core/utils/http_inspector_service/alice_service.dart';
import 'package:taro/core/utils/package_info_service.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create({required Logger logger, required Flavor flavor}) async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      logger: logger,
      analytics: FirebaseAnalytics.instance,
    );

    final packageInfoService = PackageInfoService();
    await packageInfoService.init();

    final aliceHttpInspectorService = AliceHttpInspectorService();
    aliceHttpInspectorService.init();

    final appConfigurationsStorage = await _createAppConfigurationsStorage(logger: logger);

    final deviceInfoPlugin = DeviceInfoPlugin();
    final baseDeviceInfo = await deviceInfoPlugin.deviceInfo;

    return AppDependenciesContainer(
      logger: logger,
      analyticsReporter: analyticsReporter,
      envConfig: const EnvConfig(),
      httpInspectorService: aliceHttpInspectorService,
      packageInfoService: packageInfoService,
      deviceInfoService: DeviceInfoService(
        baseDeviceInfo: baseDeviceInfo,
        isIos: Platform.isIOS,
      ),
      flavor: flavor,
      appConfigurationsStorage: appConfigurationsStorage,
    );
  }

  static Future<AppConfigurationsStorage> _createAppConfigurationsStorage({
    required Logger logger,
  }) async {
    final sharedPreferences = await SharedPreferences.getInstance();

    return SharedPreferencesStorage(
      sharedPreferences: sharedPreferences,
      logger: logger,
    );
  }
}
