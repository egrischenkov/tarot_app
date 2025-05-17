import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class DebugCardWidget extends StatelessWidget {
  const DebugCardWidget({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            UiKitSpacing.x4.h,
            const SizedBox(height: 16),
            ...intersperse(
              UiKitSpacing.x2.h,
              children,
            ),
          ],
        ),
      ),
    );
  }
}
