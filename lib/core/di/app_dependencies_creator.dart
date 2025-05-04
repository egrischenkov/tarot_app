import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:tarot_analytics/scr/firebase_analytics_reporter.dart';

class AppDependenciesCreator {
  static Future<AppDependenciesContainer> create() async {
    const analyticsReporter = FirebaseAnalyticsReporter();

    return const AppDependenciesContainer(
      analyticsReporter: analyticsReporter,
    );
  }
}
