part of '../../profile_screen.dart';

class UnauthenticatedProfileScreenView extends StatefulWidget {
  const UnauthenticatedProfileScreenView({super.key});

  @override
  State<UnauthenticatedProfileScreenView> createState() => _UnauthenticatedProfileScreenViewState();
}

class _UnauthenticatedProfileScreenViewState extends State<UnauthenticatedProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return UiKitBaseScreen(
      title: l10n.profileScreen$Title,
      bodyWithAppBarOffset: true,
      onBack: context.router.pop,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UiKitSize.x2),
        child: Column(
          children: [
            UiKitSpacing.x4.h,
            LottieBuilder.asset(Assets.lottie.signUp),
            UiKitSpacing.x4.h,
            UiKitBorderBeam(
              child: UiKitBaseSectionWrapper(
                child: UiKitBigButton.regular(
                  context: context,
                  label: l10n.profileScreen$LoginButton$Label,
                  isExpanded: true,
                  onTap: _onLoginButtonTap,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonTap() {}
}
