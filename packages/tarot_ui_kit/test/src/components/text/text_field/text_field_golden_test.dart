import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  late TextEditingController controller;

  setUpAll(() {
    controller = TextEditingController(text: 'test');
  });

  group('Text field', () {
    goldenTest(
      'light with hint text',
      fileName: 'text_field_light_with_hint_text',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitTextField(
          controller: controller,
          hintText: 'test',
        ),
      ),
    );

    goldenTest(
      'light without hint text',
      fileName: 'text_field_dark_without_hint_text',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitTextField(
          controller: controller,
        ),
      ),
    );
    goldenTest(
      'dark with hint text',
      fileName: 'text_field_dark_with_hint_text',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitTextField(
          controller: controller,
          hintText: 'test',
        ),
      ),
    );
    goldenTest(
      'dark without hint text',
      fileName: 'text_field_dark_without_hint_text',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitTextField(
          controller: controller,
        ),
      ),
    );
    goldenTest(
      'light with max lines',
      fileName: 'text_field_light_with_max_lines',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitTextField(
          controller: controller,
          maxLength: 5,
        ),
      ),
    );
    goldenTest(
      'dark with max lines',
      fileName: 'text_field_dark_with_max_lines',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitTextField(
          controller: controller,
          maxLength: 5,
        ),
      ),
    );
  });
}
