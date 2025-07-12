import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  group('UiKitTheme Colors Golden Tests', () {
    goldenTest(
      'Theme colors palette',
      fileName: 'theme_colors',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'White',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.whiteBgWhite,
            ),
          ),
        ],
      ),
    );
  });
}

class _ColorTile extends StatelessWidget {
  final Color color;

  const _ColorTile({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      color: color,
    );
  }
}
