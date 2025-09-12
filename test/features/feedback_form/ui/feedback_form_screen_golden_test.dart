import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/feedback_form/ui/feedback_form_screen.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('Feedback form screen golden tests', () {
    goldenTest(
      'Light theme',
      fileName: 'feedback_form_screen_light_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => TestWidgetWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const FeedbackFormScreen(),
      ),
    );
    goldenTest(
      'Dark theme',
      fileName: 'feedback_form_screen_dark_theme',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => TestWidgetWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const FeedbackFormScreen(),
      ),
    );
  });
}
