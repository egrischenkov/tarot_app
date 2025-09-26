import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  group('UiKitTheme Colors Golden Tests', () {
    goldenTest(
      'Theme colors palette light mode',
      fileName: 'theme_colors_light_mode',
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
          GoldenTestScenario(
            name: 'Onboarding-Background-1',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.onboardingBackground1,
            ),
          ),
          GoldenTestScenario(
            name: 'Onboarding-Background-2',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.onboardingBackground2,
            ),
          ),
          GoldenTestScenario(
            name: 'Onboarding-Background-3',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.onboardingBackground3,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.menuCardGradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.menuCardGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Content',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.menuCardContent,
            ),
          ),
        ],
      ),
    );

    goldenTest(
      'Theme colors palette dark mode',
      fileName: 'theme_colors_dark_mode',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'Accent',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.accent,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-Secondary',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.accentSecondary,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-Tertiary',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.accentTertiary,
            ),
          ),
          GoldenTestScenario(
            name: 'Text',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.text,
            ),
          ),
          GoldenTestScenario(
            name: 'Button-Text',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.buttonText,
            ),
          ),
          GoldenTestScenario(
            name: 'Text-Disabled',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.textDisabled,
            ),
          ),
          GoldenTestScenario(
            name: 'Background',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.background,
            ),
          ),
          GoldenTestScenario(
            name: 'Background-Secondary',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.backgroundSecondary,
            ),
          ),
          GoldenTestScenario(
            name: 'Success',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.success,
            ),
          ),
          GoldenTestScenario(
            name: 'Error',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.error,
            ),
          ),
          GoldenTestScenario(
            name: 'Disabled',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.disabled,
            ),
          ),
          GoldenTestScenario(
            name: 'Transparent',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.transparent,
            ),
          ),
          GoldenTestScenario(
            name: 'Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.gradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.gradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Border',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.border,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.borderGradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.borderGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Border-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.borderGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Icon',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.icon,
            ),
          ),
          GoldenTestScenario(
            name: 'Icon-Background',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.iconBackground,
            ),
          ),
          GoldenTestScenario(
            name: 'Shadow',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.shadow,
            ),
          ),
          GoldenTestScenario(
            name: 'Link',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.link,
            ),
          ),
          GoldenTestScenario(
            name: 'Onboarding-Background-1',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.onboardingBackground1,
            ),
          ),
          GoldenTestScenario(
            name: 'Onboarding-Background-2',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.onboardingBackground2,
            ),
          ),
          GoldenTestScenario(
            name: 'Onboarding-Background-3',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.onboardingBackground3,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Gradient-First',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.menuCardGradientFirst,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Gradient-Second',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.menuCardGradientSecond,
            ),
          ),
          GoldenTestScenario(
            name: 'Menu-Card-Content',
            child: _ColorTile(
              color: UiKitTheme.darkThemeColors.menuCardContent,
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
