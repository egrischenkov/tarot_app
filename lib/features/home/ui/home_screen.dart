import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final analyticsReporter = AppDependenciesScope.of(context).analyticsReporter;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.tarotMeets.image(
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            InkWell(
              onTap: () {
                analyticsReporter.logEvent(
                  const AnalyticsEvent('test_event'),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
                child: const Text('Отправить тестовое событие в Firebase'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
