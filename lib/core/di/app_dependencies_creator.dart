import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taro/core/app_runner/env_config.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/utils/alice_service.dart';
import 'package:taro/core/utils/package_info_service.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create({
    required Logger logger,
  }) async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      logger: logger,
      analytics: FirebaseAnalytics.instance,
    );

    final packageInfoService = PackageInfoService();
    await packageInfoService.init();

    final aliceService = AliceService();
    aliceService.init();

    return AppDependenciesContainer(
      logger: logger,
      analyticsReporter: analyticsReporter,
      envConfig: const EnvConfig(),
      aliceService: aliceService,
      packageInfoService: packageInfoService,
    );
  }
}
