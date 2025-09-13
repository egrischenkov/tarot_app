import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const label = 'test';
  const trailing = Text('test trailing');

  group('Bottom sheet value item', () {
    goldenTest(
      'light selected',
      fileName: 'bottom_sheet_value_item_light_selected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
        ),
      ),
    );

    goldenTest(
      'light unselected',
      fileName: 'bottom_sheet_value_item_light_unselected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: false,
        ),
      ),
    );
    goldenTest(
      'dark selected',
      fileName: 'bottom_sheet_value_item_dark_selected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
        ),
      ),
    );
    goldenTest(
      'dark unselected',
      fileName: 'bottom_sheet_value_item_dark_unselected',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
        ),
      ),
    );

    goldenTest(
      'light trailing',
      fileName: 'bottom_sheet_value_item_light_trailing',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
          trailing: trailing,
        ),
      ),
    );
    goldenTest(
      'light trailing',
      fileName: 'bottom_sheet_value_item_light_trailing',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
          trailing: trailing,
        ),
      ),
    );
    goldenTest(
      'dark trailing',
      fileName: 'bottom_sheet_value_item_dark_trailing',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: const UiKitBottomSheetValueItem(
          label: label,
          isSelected: true,
          trailing: trailing,
        ),
      ),
    );
  });
}
