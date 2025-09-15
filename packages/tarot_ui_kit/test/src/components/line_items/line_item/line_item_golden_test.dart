import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

import '../../../utils/ui_kit_golden_test_wrapper.dart';

void main() {
  const label = 'test';
  const valueLabel = 'test value label';

  group('Line item', () {
    goldenTest(
      'light with value label',
      fileName: 'line_item_light_with_value_label',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitLineItem(
          label: label,
          onTap: () {},
          valueLabel: valueLabel,
        ),
      ),
    );

    goldenTest(
      'light without value label',
      fileName: 'line_item_light_without_value_label',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.lightThemeData,
        child: UiKitLineItem(
          label: label,
          onTap: () {},
          valueLabel: null,
        ),
      ),
    );
    goldenTest(
      'dark with value label',
      fileName: 'line_item_dark_with_value_label',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitLineItem(
          label: label,
          onTap: () {},
          valueLabel: valueLabel,
        ),
      ),
    );
    goldenTest(
      'dark without value label',
      fileName: 'line_item_dark_without_value_label',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 600,
      ),
      builder: () => UiKitGoldenTestWrapper(
        themeData: UiKitTheme.darkThemeData,
        child: UiKitLineItem(
          label: label,
          onTap: () {},
          valueLabel: null,
        ),
      ),
    );
  });
}
