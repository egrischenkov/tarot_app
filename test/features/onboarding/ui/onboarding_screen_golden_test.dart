import 'package:alchemist/alchemist.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:taro/features/onboarding/ui/onboarding_screen.dart';

import '../../../utils/golden_test_widget_wrapper.dart';

void main() {
  group('OnboardingScreen Golden Tests', () {
    goldenTest(
      'renders onboarding screen at page 1 (initial)',
      fileName: 'onboarding_page_1',
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      builder: () => const GoldenTestWidgetWrapper(
        child: OnboardingScreen(
          initialPage: 0,
        ),
      ),
    );

    goldenTest(
      'renders onboarding screen at page 2',
      fileName: 'onboarding_page_2',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      builder: () => const GoldenTestWidgetWrapper(
        child: OnboardingScreen(
          initialPage: 1,
        ),
      ),
    );

    goldenTest(
      'renders onboarding screen at last page with "Go" button',
      fileName: 'onboarding_page_3_last',
      constraints: const BoxConstraints(
        maxWidth: 600,
        maxHeight: 1600,
      ),
      pumpBeforeTest: (_) async {
        pumpNTimes(4, const Duration(seconds: 5));
      },
      builder: () => const GoldenTestWidgetWrapper(
        child: OnboardingScreen(
          initialPage: 2,
        ),
      ),
    );
  });
}
