import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const title = 'test';
  const trailing = Text('test trailing');

  group('Check box line item', () {
    goldenTest(
      'light selected',
      fileName: 'check_box_line_item_light_selected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitCheckboxLineItem(
          title: title,
          onChanged: (_) {},
          isSelected: true,
        ),
      ),
    );

    goldenTest(
      'light unselected',
      fileName: 'check_box_line_item_light_unselected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitCheckboxLineItem(
          title: title,
          onChanged: (_) {},
          isSelected: false,
        ),
      ),
    );
    goldenTest(
      'dark selected',
      fileName: 'check_box_line_item_dark_selected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitCheckboxLineItem(
          title: title,
          onChanged: (_) {},
          isSelected: true,
        ),
      ),
    );
    goldenTest(
      'dark unselected',
      fileName: 'check_box_line_item_light_unselected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitCheckboxLineItem(
          title: title,
          onChanged: (_) {},
          isSelected: false,
        ),
      ),
    );
  });
}
