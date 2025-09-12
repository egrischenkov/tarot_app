import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/about/ui/about_screen.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('About screen golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'about_screen_light_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => TestWidgetWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const AboutScreen(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'about_screen_dark_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => TestWidgetWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const AboutScreen(),
      ),
    );
  });
}
