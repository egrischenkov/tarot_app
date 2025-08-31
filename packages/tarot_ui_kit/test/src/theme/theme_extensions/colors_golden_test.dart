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
            name: 'Accent-orange',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentOrange,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-yellow',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentYellow,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-yellow-sec',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentYellowSec,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-purple',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentPurple,
            ),
          ),
          GoldenTestScenario(
            name: 'Accent-purple-sec',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.accentPurpleSec,
            ),
          ),
          GoldenTestScenario(
            name: 'Purple-text',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.purpleText,
            ),
          ),
          GoldenTestScenario(
            name: 'Itsy-bitsy-black',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.itsyBitsyBlack,
            ),
          ),
          GoldenTestScenario(
            name: 'Grey-text',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.greyText,
            ),
          ),
          GoldenTestScenario(
            name: 'White-text',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.whiteText,
            ),
          ),
          GoldenTestScenario(
            name: 'White',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.whiteBgWhite,
            ),
          ),
          GoldenTestScenario(
            name: 'White-bg-white',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.whiteBgWhite,
            ),
          ),
          GoldenTestScenario(
            name: 'White-bg-secondary',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.whiteBgSecondary,
            ),
          ),
          GoldenTestScenario(
            name: 'Black-bg-mudberry',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.blackBgMudberry,
            ),
          ),
          GoldenTestScenario(
            name: 'Black-bg-purple',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.blackBgPurple,
            ),
          ),
          GoldenTestScenario(
            name: 'Good-green',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.goodGreen,
            ),
          ),
          GoldenTestScenario(
            name: 'Wrong-red',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.wrongRed,
            ),
          ),
          GoldenTestScenario(
            name: 'Light-yellow',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.lightYellow,
            ),
          ),
          GoldenTestScenario(
            name: 'Transparent',
            child: _ColorTile(
              color: UiKitTheme.lightThemeColors.transparent,
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
