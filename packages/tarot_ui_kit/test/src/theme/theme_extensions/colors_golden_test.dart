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
            name: 'Accent',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accent,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-Secondary',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentSecondary,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-Tertiary',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentTertiary,
            ),
          ),
          GoldenTestScenario(
            name: 'Text',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.text,
            ),
          ),
          GoldenTestScenario(
            name: 'Button-Text',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.buttonText,
            ),
          ),
          GoldenTestScenario(
            name: 'Text-Disabled',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.textDisabled,
            ),
          ),
          GoldenTestScenario(
            name: 'Background',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.background,
            ),
          ),
          GoldenTestScenario(
            name: 'Background-Secondary',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.backgroundSecondary,
            ),
          ),
          GoldenTestScenario(
            name: 'Success',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.success,
            ),
          ),
          GoldenTestScenario(
            name: 'Error',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.error,
            ),
          ),
          GoldenTestScenario(
            name: 'Disabled',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.disabled,
            ),
          ),
          GoldenTestScenario(
            name: 'Transparent',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.transparent,
            ),
          ),
          GoldenTestScenario(
            name: 'Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.gradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.gradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Border',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.border,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.borderGradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.borderGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.borderGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.icon,
            ),
          ),
          GoldenTestScenario(
            name: 'Icon-Background',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.iconBackground,
            ),
          ),
          GoldenTestScenario(
            name: 'Shadow',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.shadow,
            ),
          ),
          GoldenTestScenario(
            name: 'Link',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.link,
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
