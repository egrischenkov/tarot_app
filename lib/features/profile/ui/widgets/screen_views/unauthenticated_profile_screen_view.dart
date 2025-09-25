part of '../../screens/profile_screen.dart';

class UnauthenticatedProfileScreenView extends StatefulWidget {
  const UnauthenticatedProfileScreenView({super.key});

  @override
  State<UnauthenticatedProfileScreenView> createState() => _UnauthenticatedProfileScreenViewState();
}

class _UnauthenticatedProfileScreenViewState extends State<UnauthenticatedProfileScreenView> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final fonts = context.fonts;

    return UiKitBaseScreen(
      title: l10n.profileScreen$Title,
      bodyWithAppBarOffset: true,
      onBack: context.router.pop,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: UiKitSize.x2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: intersperse(
            UiKitSpacing.x4.h,
            [
              LottieBuilder.asset(Assets.lottie.signUp),
              Text(l10n.profileScreen$JoinUs, style: fonts.headlineLarge),
              UiKitBorderBeam(
                child: UiKitBaseSectionWrapper(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UiKitSpacing.x4.h,
                      UiKitBigButton.regular(
                        context: context,
                        label: l10n.profileScreen$LoginButton$Label,
                        isExpanded: true,
                        onTap: _onLoginButtonTap,
                      ),
                    ],
                  ),
                ),
              ),
              const SettingsSectionWidget(isAuthenticated: false),
            ],
            insertFirst: true,
          ).toList(),
        ),
      ),
    );
  }

  void _onLoginButtonTap() {
    final authBloc = context.read<ProfileBloc>();
    final router = context.router;

    router.push(AuthRoute(authBloc: authBloc));
  }
}
