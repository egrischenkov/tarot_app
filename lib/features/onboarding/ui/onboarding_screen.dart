import 'package:auto_route/auto_route.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/features/onboarding/ui/widgets/onboarding_page_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  /// Initial page index for the onboarding screen.
  /// Added for testing purposes.
  final int _initialPage;

  const OnboardingScreen({
    int initialPage = 0,
    super.key,
  }) : _initialPage = initialPage;

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late int _selectedIndex = widget._initialPage;
  late final _pageController = PageController(initialPage: _selectedIndex);
  bool isNextButtonVisible = false;

  late final List<OnboardingPageData> _pagesData = [
    OnboardingPageData(
      title: context.l10n.onboarding$Title$First(context.l10n.appName),
      subtitle: context.l10n.onboarding$Subtitle$First,
      image: Assets.icons.onboarding1.svg(),
      backgroundColor: context.colors.onboardingBackground1,
      background: LottieBuilder.asset(Assets.lottie.onboardingBg1),
    ),
    OnboardingPageData(
      title: context.l10n.onboarding$Title$Second,
      subtitle: context.l10n.onboarding$Subtitle$Second,
      image: Assets.icons.onboarding2.svg(),
      backgroundColor: context.colors.onboardingBackground2,
      background: LottieBuilder.asset(Assets.lottie.onboardingBg2),
    ),
    OnboardingPageData(
      title: context.l10n.onboarding$Title$Third,
      subtitle: context.l10n.onboarding$Subtitle$Third,
      image: LottieBuilder.asset(Assets.lottie.sunBreathing),
      backgroundColor: context.colors.onboardingBackground3,
      background: LottieBuilder.asset(Assets.lottie.onboardingBg3),
    ),
  ];

  @override
  void initState() {
    super.initState();

    _pageController.addListener(() {
      if ((_selectedIndex + 1) == _pagesData.length) {
        setState(() {});
        Future.delayed(const Duration(milliseconds: 500)).then((_) {
          if (mounted) {
            setState(() => isNextButtonVisible = true);
          }
        });
      } else {
        setState(() => isNextButtonVisible = false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        pageController: _pageController,
        onChange: (index) {
          _selectedIndex = index;
        },
        duration: const Duration(milliseconds: 600),
        colors: _pagesData.map((e) => e.backgroundColor).toList(),
        itemCount: _pagesData.length,
        nextButtonBuilder: (context) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 1500),
            child: (_selectedIndex + 1) == _pagesData.length
                ? AnimatedOpacity(
                    duration: const Duration(milliseconds: 1500),
                    opacity: isNextButtonVisible ? 1.0 : 0.0,
                    child: UiKitBigButton.regular(
                      context: context,
                      label: context.l10n.onboarding$Button$Label,
                      onTap: _onFinish,
                    ),
                  )
                : const SizedBox.shrink(),
          );
        },
        itemBuilder: (index) {
          final pageData = _pagesData[index];

          return OnboardingPageWidget(data: pageData);
        },
      ),
    );
  }

  void _onFinish() {
    context.router.replace(const HomeRoute());
    context.appDependenciesContainer.appConfigurationsStorage.setOnboardingCompleted(value: true);
  }
}
