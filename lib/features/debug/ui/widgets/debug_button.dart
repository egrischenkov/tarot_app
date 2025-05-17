import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';

class DebugButton extends StatelessWidget {
  const DebugButton({super.key});

  @override
  Widget build(BuildContext context) {
    final envConfig = context.appDependenciesContainer.envConfig;

    if (envConfig.environment.isProd) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: const Icon(
        Icons.bug_report_outlined,
        size: 25,
      ),
      onPressed: () => context.router.navigate(const DebugRoute()),
    );
  }
}
