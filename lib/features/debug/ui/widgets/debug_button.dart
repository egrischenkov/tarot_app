import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class DebugButton extends StatelessWidget {
  const DebugButton({super.key});

  @override
  Widget build(BuildContext context) {
    final flavor = context.appDependenciesContainer.flavor;

    if (flavor.isProd) {
      return const SizedBox.shrink();
    }

    return IconButton(
      icon: Icon(
        Icons.bug_report_outlined,
        size: 25,
        color: context.colors.icon,
      ),
      onPressed: () => context.router.navigate(const DebugRoute()),
    );
  }
}
