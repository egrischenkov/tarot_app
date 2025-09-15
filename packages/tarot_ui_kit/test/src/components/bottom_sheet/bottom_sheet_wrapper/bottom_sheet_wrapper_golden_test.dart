import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
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

  group('Bottom sheet wrapper', () {
    goldenTest(
      'light expanded',
      fileName: 'bottom_sheet_wrapper_light_expanded',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitBottomSheetWrapper(
          body: body,
          isExpanded: true,
        ),
      ),
    );

    goldenTest(
      'light not expanded',
      fileName: 'bottom_sheet_wrapper_light_not_expanded',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitBottomSheetWrapper(
          body: body,
          isExpanded: false,
        ),
      ),
    );

    goldenTest(
      'dark expanded',
      fileName: 'bottom_sheet_wrapper_dark_expanded',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitBottomSheetWrapper(
          body: body,
          isExpanded: true,
        ),
      ),
    );

    goldenTest(
      'dark not expanded',
      fileName: 'bottom_sheet_wrapper_dark_not_expanded',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitBottomSheetWrapper(
          body: body,
          isExpanded: false,
        ),
      ),
    );
  });
}
