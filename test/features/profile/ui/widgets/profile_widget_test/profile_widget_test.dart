import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/features/profile/ui/widgets/profile_widget.dart';

import '../../../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('Profile widget', () {
    goldenTest(
      'regular test',
      fileName: 'profile_widget',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => TestWidgetWrapper(
        child: ProfileWidget(
          size: 64,
          child: Assets.icons.ava1.svg(),
        ),
      ),
    );
  });
}
