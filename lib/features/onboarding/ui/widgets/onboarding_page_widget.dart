import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class OnboardingPageData {
  final String title;
  final String subtitle;
  final Widget image;
  final Color backgroundColor;
  final Widget? background;

  OnboardingPageData({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.backgroundColor,
    this.background,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPageData data;

  const OnboardingPageWidget({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final fonts = context.fonts;

    return Stack(
      children: [
        if (data.background != null) data.background!,
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: UiKitSpacing.x10,
            horizontal: UiKitSpacing.base * 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 3),
              Flexible(
                flex: 20,
                child: data.image,
              ),
              const Spacer(flex: 1),
              Text(
                data.title.toUpperCase(),
                style: fonts.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              Text(
                data.subtitle,
                style: fonts.bodyEmphasized,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 10),
            ],
          ),
        ),
      ],
    );
  }
}
