import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:tarot_analytics/scr/analytics_reporter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  bool _isRotating = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(); // запускаем сразу, но остановим
    _controller.stop();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleRotation(AnalyticsReporter analyticsReporter) {
    analyticsReporter.logEvent(
      const AnalyticsEvent('haptic_event'),
    );
    HapticFeedback.mediumImpact();

    setState(() {
      if (_isRotating) {
        _controller.stop();
      } else {
        _controller.repeat();
      }
      _isRotating = !_isRotating;
    });
  }

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
            RotationTransition(
              turns: _controller,
              child: Assets.tarotMeets.image(
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 100),
            InkWell(
              onTap: () => _toggleRotation(analyticsReporter),
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.yellow,
                ),
                child: Text(
                  _isRotating ? 'Стоп' : 'Закружило голову хмельную',
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                analyticsReporter.logEvent(
                  const AnalyticsEvent('test_event'),
                );
                HapticFeedback.lightImpact();
              },
              borderRadius: BorderRadius.circular(8),
              child: Ink(
                padding: const EdgeInsets.all(16),
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
