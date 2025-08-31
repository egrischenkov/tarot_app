import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/src/components/buttons/big_button.dart';

void main() {
  group('Big button', () {
    goldenTest(
      'regular',
      fileName: 'big_button_regular',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => Builder(
        builder: (context) => UiKitBigButton.regular(
          context: context,
          label: 'regular',
        ),
      ),
    );
    goldenTest(
      'secondary',
      fileName: 'big_button_secondary',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => Builder(
        builder: (context) => UiKitBigButton.secondary(
          context: context,
          label: 'secondary',
        ),
      ),
    );
  });
}
