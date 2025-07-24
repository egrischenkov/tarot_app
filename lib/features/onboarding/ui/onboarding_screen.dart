import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
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
  int _pageIndicatorIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(
      initialPage: widget._initialPage,
    );
    _pageIndicatorIndex = widget._initialPage;
  }

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  List<_PageWidget> get _pages => [
        _PageWidget(
          image: Assets.images.welcome1.image(),
          title: context.l10n.onboarding$Path,
        ),
        _PageWidget(
          image: Assets.images.welcome2.image(),
          title: context.l10n.onboarding$Answer,
        ),
        _PageWidget(
          image: Assets.images.welcome3.image(),
          title: context.l10n.onboarding$Cards,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fonts = context.fonts;
    final colors = context.colors;

    final isLastPage = _pageIndicatorIndex == _pages.length - 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.whiteBgWhite,
        title: Text(l10n.appName, style: fonts.largeTitleRegular),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TextButton(
              onPressed: () => _onNextTap(isLastPage),
              child: AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                style: isLastPage
                    ? fonts.largeTitleRegular.copyWith(
                        color: colors.onSurface,
                      )
                    : fonts.testStyle.copyWith(
                        color: colors.grey.withValues(alpha: 0.8),
                      ),
                child: Text(
                  isLastPage ? l10n.onboarding$Start : l10n.onboarding$Skip,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: colors.whiteBgWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                children: _pages,
              ),
            ),
            UiKitSpacing.x6.h,
            UiKitPageIndicator(
              count: _pages.length,
              selectedIndex: _pageIndicatorIndex,
            ),
          ],
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _pageIndicatorIndex = index;
    });
  }

  void _onNextTap(bool isLastPage) {
    if (isLastPage) {
      context.router.replace(const HomeRoute());
      context.appDependenciesContainer.appConfigurationsStorage.setOnboardingCompleted(value: true);

      return;
    }

    _pageController.animateToPage(
      duration: const Duration(milliseconds: 300),
      _pages.length - 1,
      curve: Curves.easeInOut,
    );
  }
}

class _PageWidget extends StatelessWidget {
  final Image image;
  final String title;

  const _PageWidget({
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: image),
        UiKitSpacing.x6.h,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: context.fonts.headlineLarge.copyWith(
              color: context.colors.textUnselected,
            ),
          ),
        ),
      ],
    );
  }
}
