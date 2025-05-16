import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  group(
    'UiKitTheme Fonts Golden Tests',
    () {
      goldenTest(
        'Typography styles',
        fileName: 'typography',
        builder: () => GoldenTestGroup(
          columns: 3,
          children: [
            GoldenTestScenario(
              name: 'Headers',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextTile(
                    style: UiKitTheme.fonts.testStyle,
                    label: 'Test Style',
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class _TextTile extends StatelessWidget {
  final TextStyle style;
  final String label;

  const _TextTile({
    required this.style,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: style,
    );
  }
}
