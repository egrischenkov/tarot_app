part of '../../screens/profile_screen.dart';

class AuthenticatedProfileScreenView extends StatefulWidget {
  const AuthenticatedProfileScreenView({super.key});

  @override
  State<AuthenticatedProfileScreenView> createState() => _AuthenticatedProfileScreenViewState();
}

class _AuthenticatedProfileScreenViewState extends State<AuthenticatedProfileScreenView> {
  final _scrollController = ScrollController();
  double _offset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _offset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colors = context.colors;

    return UiKitBaseScreen(
      title: l10n.profileScreen$Title,
      actions: [
        GestureDetector(
          onTap: _onShareTap,
          behavior: HitTestBehavior.translucent,
          child: Assets.icons.share.svg(
            width: UiKitSize.x5,
            height: UiKitSize.x5,
            colorFilter: ColorFilter.mode(
              colors.icon,
              BlendMode.srcIn,
            ),
          ),
        ),
        GestureDetector(
          onTap: _onSettingsTap,
          behavior: HitTestBehavior.translucent,
          child: Assets.icons.settings.svg(
            width: UiKitSize.x5,
            height: UiKitSize.x5,
            colorFilter: ColorFilter.mode(
              colors.icon,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
      scrollOffset: _offset,
      onBack: () => context.router.pop(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * .6,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [colors.gradientFirst, colors.gradientSecond],
              ),
            ),
          ),
          Stack(
            children: [
              // This widget is needed to cover bottom part of screen with background color
              // which corresponds to profile screen background.
              // It is needed to achieve transparent background for avatar widget and at the same time consistent background color for ListView.
              //
              // For example, if we remove this widget, then when we scroll ListView to the top,
              // we will see that background color of ListView is different from background color of ListView body.
              Positioned(
                bottom: 0,
                height: MediaQuery.of(context).size.height * .4,
                width: MediaQuery.of(context).size.width,
                child: ColoredBox(color: colors.backgroundSecondary),
              ),
              ProfileRefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(
                    top: kToolbarHeight + UiKitAppBar.height + UiKitSpacing.x10,
                  ),
                  shrinkWrap: true,
                  children: [
                    BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        return ProfileHeaderWidget(
                          name: state.mapOrNull(
                            authenticated: (state) => state.user.name,
                          ),
                        );
                      },
                    ),
                    ColoredBox(
                      color: colors.backgroundSecondary,
                      child: Column(
                        children: [
                          UiKitSpacing.x4.h,
                          ...intersperse(
                            UiKitSpacing.x4.h,
                            [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: UiKitSpacing.x2),
                                child: UiKitBorderBeam(
                                  borderWidth: 3,
                                  child: ProfileItem(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              l10n.profileScreen$Subscription,
                                              style: context.fonts.bodyEmphasized,
                                            ),
                                            const UiKitForwardButton(),
                                          ],
                                        ),
                                        UiKitSpacing.x3.h,
                                        Text(
                                          l10n.profileScreen$SuggestSubscription,
                                          style: context.fonts.xsLabel,
                                        ),
                                        UiKitSpacing.x3.h,
                                        UiKitBigButton.regular(
                                          context: context,
                                          label: l10n.profileScreen$ChooseSubscription,
                                          onTap: () {},
                                          isExpanded: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: UiKitSpacing.x2,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.background,
                                  borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                                ),
                              ),
                              Container(
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: UiKitSpacing.x2,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.background,
                                  borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                                ),
                              ),
                              Container(
                                height: 150,
                                margin: const EdgeInsets.symmetric(
                                  horizontal: UiKitSpacing.x2,
                                ),
                                decoration: BoxDecoration(
                                  color: colors.background,
                                  borderRadius: BorderRadius.circular(UiKitSpacing.x4),
                                ),
                              ),
                              UiKitSpacing.x4.h,
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onShareTap() {
    final l10n = context.l10n;
    const link = 'https://www.kinopoisk.ru/film/868675/';

    SharePlus.instance.share(
      ShareParams(
        title: l10n.share$Title,
        text: l10n.share$Suggest(
          link,
          l10n.appName,
        ),
      ),
    );
  }

  void _onSettingsTap() {
    context.router.push(const SettingsRoute());
  }

  Future<void> _onRefresh() async {
    // Simulate a refresh delay
    await Future.delayed(const Duration(seconds: 2));
  }
}
