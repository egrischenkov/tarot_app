import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/features/debug/ui/widgets/debug_button.dart';

/// Needs for wrapping the entire app with [DebugButton]
@RoutePage()
class DebugWrapperEntry extends StatelessWidget {
  const DebugWrapperEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        AutoRouter(),
        Positioned(
          left: 5,
          bottom: 5,
          child: DebugButton(),
        ),
      ],
    );
  }
}
