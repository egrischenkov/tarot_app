import 'package:flutter/material.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/di/app_dependencies_container.dart';
import 'package:taro/core/di/app_dependencies_scope.dart';
import 'package:taro/core/localization/gen/app_localizations.g.dart';

void main() {
  runApp(const Taro());
}

class Taro extends StatelessWidget {
  const Taro({super.key});

  @override
  Widget build(BuildContext context) {
    return AppDependenciesScope(
      dependencies: const AppDependenciesContainer(),
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Center(child: Assets.tarotMeets.image(width: 200, height: 200, fit: BoxFit.cover)),
      ),
    );
  }
}
