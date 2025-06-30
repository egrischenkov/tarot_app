import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  group('UiKitPageIndicator Golden Tests', () {
    goldenTest(
      'Filled badge golden test',
      fileName: 'page_indicator',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'Selected first bullet',
            child: Builder(
              builder: (context) => const UiKitPageIndicator(
                count: 3,
                selectedIndex: 0,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Selected second bullet',
            child: Builder(
              builder: (context) => const UiKitPageIndicator(
                count: 3,
                selectedIndex: 1,
              ),
            ),
          ),
          GoldenTestScenario(
            name: 'Selected third bullet',
            child: Builder(
              builder: (context) => const UiKitPageIndicator(
                count: 3,
                selectedIndex: 2,
              ),
            ),
          ),
        ],
      ),
    );
  });
}
