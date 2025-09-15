import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const title = 'test';
  final items = [
    UiKitLineItem(label: title, onTap: () {}),
    UiKitLineItem(label: title, onTap: () {}),
    UiKitLineItem(label: title, onTap: () {}),
    UiKitLineItem(label: title, onTap: () {}),
  ];

  group('Line items group', () {
    goldenTest(
      'light',
      fileName: 'line_items_group_light',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitLineItemsGroup(
          title: title,
          items: items,
        ),
      ),
    );
    goldenTest(
      'dark',
      fileName: 'line_items_group_dark',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitLineItemsGroup(
          title: title,
          items: items,
        ),
      ),
    );
  });
}
