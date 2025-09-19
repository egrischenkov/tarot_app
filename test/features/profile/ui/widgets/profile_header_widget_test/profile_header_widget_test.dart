import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/profile/ui/screens/profile_screen.dart';

import '../../../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('Profile header widget', () {
    goldenTest(
      'with name',
      fileName: 'profile_header_with_name',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => const GoldenTestWidgetWrapper(
        child: ProfileHeaderWidget(
          name: 'test',
        ),
      ),
    );
  });
}
