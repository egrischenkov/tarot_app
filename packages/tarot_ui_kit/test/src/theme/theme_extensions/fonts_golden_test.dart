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
              name: 'Fonts',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).largeTitleEmphasized,
                    label: 'Large Title Emphasized',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).largeTitleRegular,
                    label: 'Large Title Regular',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).headlineRegular,
                    label: 'Headline Regular',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).headlineLarge,
                    label: 'Headline Large',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).bodyRegular,
                    label: 'Body Regular',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).bodyEmphasized,
                    label: 'Body Emphasized',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).bodyEmphasizedItalic,
                    label: 'Body Emphasized Italic',
                  ),
                  _TextTile(
                    style: UiKitTheme.fonts(UiKitTheme.lightThemeColors).xsLabel,
                    label: 'XS Label',
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
