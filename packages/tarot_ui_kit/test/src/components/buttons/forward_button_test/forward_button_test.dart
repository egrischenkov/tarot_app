import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

void main() {
  goldenTest(
    'Forward button',
    fileName: 'forward_button',
    constraints: const BoxConstraints(
      maxWidth: 600,
      maxHeight: 800,
    ),
    builder: () => const UiKitForwardButton(),
  );
}
