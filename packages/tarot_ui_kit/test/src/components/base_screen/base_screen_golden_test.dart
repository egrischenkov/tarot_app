import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const testTitle = 'test';
  final body = Column(
    children: [
      const Text('test'),
      UiKitSpacing.x4.h,
      Container(
        height: 50,
        width: double.infinity,
        color: Colors.red,
      ),
    ],
  );
  const actions = [
    Icon(Icons.abc, color: Colors.red),
    Icon(Icons.abc_outlined, color: Colors.red),
  ];

  group('Base screen', () {
    goldenTest(
      'light with offset',
      fileName: 'base_screen_with_offset_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitBaseScreen(
          title: testTitle,
          body: body,
          actions: actions,
          bodyWithAppBarOffset: true,
          scrollOffset: 150,
        ),
      ),
    );

    goldenTest(
      'light without offset',
      fileName: 'base_screen_without_offset_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitBaseScreen(
          title: testTitle,
          body: body,
          actions: actions,
          bodyWithAppBarOffset: false,
          scrollOffset: 150,
        ),
      ),
    );

    goldenTest(
      'dark with offset',
      fileName: 'base_screen_with_offset_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitBaseScreen(
          title: testTitle,
          body: body,
          actions: actions,
          bodyWithAppBarOffset: true,
          scrollOffset: 150,
        ),
      ),
    );

    goldenTest(
      'dark without offset',
      fileName: 'base_screen_without_offset_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitBaseScreen(
          title: testTitle,
          body: body,
          actions: actions,
          bodyWithAppBarOffset: false,
          scrollOffset: 150,
        ),
      ),
    );
  });
}
