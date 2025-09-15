import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const text = 'test';

  group('Text link', () {
    goldenTest(
      'light',
      fileName: 'text_link_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitTextLink(text: text, onTap: () {}),
      ),
    );
    goldenTest(
      'dark',
      fileName: 'text_link_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitTextLink(text: text, onTap: () {}),
      ),
    );
  });
}
