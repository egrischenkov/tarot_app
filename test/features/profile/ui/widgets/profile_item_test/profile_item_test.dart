import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/profile/ui/profile_screen.dart';

import '../../../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('Profile item widget', () {
    goldenTest(
      'regular test',
      fileName: 'profile_item',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 800,
      ),
      builder: () => GoldenTestWidgetWrapper(
        child: Container(
          width: 600,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: Colors.black,
          child: const Column(
            children: [
              SizedBox(height: 16),
              ProfileItem(child: Text('test')),
              SizedBox(height: 16),
              ProfileItem(child: Text('test')),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  });
}
