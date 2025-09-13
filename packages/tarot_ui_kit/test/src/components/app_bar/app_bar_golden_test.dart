import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const testTitle = 'test';
  const actions = [
    Icon(Icons.abc, color: Colors.red),
    Icon(Icons.abc_outlined, color: Colors.red),
  ];

  group('App bar', () {
    goldenTest(
      'light with offset',
      fileName: 'app_bar_with_offset_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 200,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const UiKitAppBar(
          title: testTitle,
          actions: actions,
          scrollOffset: 150,
        ),
      ),
    );

    goldenTest(
      'light without offset',
      fileName: 'app_bar_without_offset_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 200,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const UiKitAppBar(
          title: testTitle,
          actions: actions,
        ),
      ),
    );

    goldenTest(
      'dark with offset',
      fileName: 'app_bar_with_offset_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 200,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitAppBar(
          title: testTitle,
          actions: actions,
          scrollOffset: 150,
        ),
      ),
    );

    goldenTest(
      'dark without offset',
      fileName: 'app_bar_without_offset_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 200,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitAppBar(
          title: testTitle,
          actions: actions,
        ),
      ),
    );
  });
}
