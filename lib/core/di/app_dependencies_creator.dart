import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';
import 'package:tarot_logger/logger.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create({
    required AppLogger appLogger,
  }) async {
    final analyticsReporter = FirebaseAnalyticsReporter(
      analytics: FirebaseAnalytics.instance,
    );

    return AppDependenciesContainer(
      appLogger: appLogger,
      analyticsReporter: analyticsReporter,
    );
  }
}
