import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tarot_ui_kit/src/components/border_beam.dart';

void main() {
  group('Border beam', () {
    goldenTest(
      'default beam test',
      fileName: 'default_border_beam',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      builder: () => UiKitBorderBeam(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: const Text('test'),
        ),
      ),
    );
    goldenTest(
      'custom beam test',
      fileName: 'custom_border_beam',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      builder: () => UiKitBorderBeam(
        borderRadius: BorderRadius.circular(12),
        borderWidth: 5,
        padding: const EdgeInsets.all(16),
        duration: const Duration(seconds: 15),
        child: const Text('test'),
      ),
    );
  });
}
