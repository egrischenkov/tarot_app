import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taro/app/domain/entities/theme_option.dart';
import 'package:taro/app/ui/bloc/language/language_bloc.dart';
import 'package:taro/app/ui/bloc/theme/theme_bloc.dart';
import 'package:taro/core/assets/gen/assets.gen.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/routing/app_router.dart';
import 'package:taro/core/utils/map_with_index.dart';
import 'package:taro/features/home/domain/entities/menu_card_model.dart';
import 'package:taro/features/home/ui/animations/home_screen_animations.dart';
import 'package:taro/features/home/ui/utils/card_animation_calculator.dart';
import 'package:taro/features/home/ui/utils/reorder_utils.dart';
import 'package:taro/features/home/ui/widgets/menu_card_widget.dart';
import 'package:taro/features/profile/ui/widgets/profile_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

/// This screen is the main entry point for the user's interactive card experience.
/// It displays a dynamic stack of tarot menu cards that animate when selected.
/// The animation logic is encapsulated in [HomeScreenAnimations] and card positioning
/// is calculated by [CardAnimationCalculator].
///
/// Cards reposition themselves based on selection, and the stack order is managed
/// through [reorderStack] to maintain the correct visual order.
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  static const _dailyCardId = 'daily_card';
  static const _cardsCatalogId = 'cards_catalog';
  static const _yesNoId = 'yes_no';

  static const _pageChangingDuration = Duration(milliseconds: 400);

  late final HomeScreenAnimations _animations;
  late double _cardWidth;
  late double _cardHeight;

  late var _selectedCard = _menuCards.first;
  int _selectedCardIndex = 0;
  MenuCardModel? _previousSelectedCard;
  late String _visibleTitle = _menuCards.first.getName(context);

  final _menuCards = [
    MenuCardModel(id: _HomeScreenState._dailyCardId),
    MenuCardModel(id: _HomeScreenState._cardsCatalogId),
    MenuCardModel(id: _HomeScreenState._yesNoId),
  ];

  final List<String> _deckOrder = [
    _HomeScreenState._dailyCardId,
    _HomeScreenState._cardsCatalogId,
    _HomeScreenState._yesNoId,
  ];

  bool _isStackReordered = false;
  bool _isTitleAnimationTrigger = true;

  @override
  void initState() {
    super.initState();
    _animations = HomeScreenAnimations(vsync: this)
      ..controller.addListener(_animationHooks)
      ..controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animations.controller.reset();
        }
      });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    _cardWidth = screenWidth * 0.4;
    _cardHeight = _cardWidth * 1.7;
  }

  @override
  void dispose() {
    _animations.dispose();
    super.dispose();
  }

  bool _isSelectedCard(MenuCardModel card) => _selectedCard.id == card.id;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final fonts = context.fonts;

    final themeOption = context.read<ThemeBloc>().state.themeOption;

    const profileIconSize = UiKitSize.x10;
    const profileIconVerticalPadding = UiKitSpacing.x2;
    final cardScreenTopPadding = profileIconSize + profileIconVerticalPadding + MediaQuery.of(context).padding.top;

    return BlocListener<LanguageBloc, LanguageState>(
      listener: (context, _) {
        setState(() {
          _isTitleAnimationTrigger = false;
          Future.delayed(_pageChangingDuration).then((_) {
            setState(() {
              _visibleTitle = _selectedCard.getName(context);
              _isTitleAnimationTrigger = true;
            });
          });
        });
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: colors.transparent,
          statusBarIconBrightness: switch (themeOption) {
            ThemeOption.light => Brightness.dark,
            ThemeOption.dark => Brightness.light,
            ThemeOption.system => null,
          },
        ),
        child: Scaffold(
          body: AutoTabsRouter(
            duration: _pageChangingDuration,
            transitionBuilder: (context, child, animation) => FadeTransition(
              opacity: animation,
              child: child,
            ),
            routes: const [
              DailyCardRoute(),
              CardsCatalogRoute(),
              YesNoRoute(),
            ],
            builder: (context, child) {
              final tabsRouter = AutoTabsRouter.of(context);

              return Container(
                padding: MediaQuery.of(context).padding,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [colors.gradientFirst, colors.gradientSecond],
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        padding: const EdgeInsets.all(UiKitSpacing.x4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UiKitEnhancedTextRevealEffect(
                              text: _visibleTitle,
                              trigger: _isTitleAnimationTrigger,
                              duration: _pageChangingDuration,
                              style: fonts.largeTitleEmphasized,
                            ),
                            Hero(
                              tag: ProfileWidget.heroTag,
                              child: ProfileWidget(
                                size: UiKitSize.x10,
                                onTap: _onProfileTap,
                                child: Assets.icons.ava1.svg(
                                  height: UiKitSize.x10,
                                  width: UiKitSize.x10,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: _animations.controller,
                      builder: (context, _) {
                        return Positioned.fill(
                          top: cardScreenTopPadding,
                          child: Stack(
                            children: _menuCards.mapWithIndex((index, card, _, __) {
                              final animationValues = CardAnimationCalculator(
                                context: context,
                                animations: _animations,
                                cardWidth: _cardWidth,
                                cardHeight: _cardHeight,
                                selectedCardIndex: _selectedCardIndex,
                                selectedCard: _selectedCard,
                                previousSelectedCard: _previousSelectedCard,
                                menuCards: _menuCards,
                                deckOrder: _deckOrder,
                                isStackReordered: _isStackReordered,
                              ).calculate(index, card);

                              final isPreviousSelected = card.id == _previousSelectedCard?.id;

                              return MenuCardWidget(
                                name: card.getName(context),
                                verticalOffset: animationValues.verticalOffset,
                                horizontalOffset: animationValues.horizontalOffset,
                                height: animationValues.height,
                                width: animationValues.width,
                                heightFactor: animationValues.heightFactor,
                                angle: animationValues.angle,
                                yAngle: animationValues.yAngle,
                                borderRadius:
                                    (_animations.controller.value >= 0.3 && _animations.controller.value <= 5.0) &&
                                            (isPreviousSelected || _isSelectedCard(card))
                                        ? BorderRadius.circular(24)
                                        : const BorderRadius.vertical(top: Radius.circular(24)),
                                icon: Icon(
                                  card.icon,
                                  color: Colors.blueAccent,
                                ),
                                onTap: () => _onCardTap(card, index, tabsRouter),
                                backSideWidget: child,
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _animationHooks() {
    if (_animations.controller.value >= 0.7 && !_isStackReordered) {
      _changeStackOrder();
      _isStackReordered = true;
    } else if (_animations.controller.value < 0.7) {
      _isStackReordered = false;
    }
  }

  void _changeStackOrder() {
    setState(() {
      reorderStack(
        cards: _menuCards,
        selectedIndex: _selectedCardIndex,
        previousCard: _previousSelectedCard,
        deckOrder: _deckOrder,
      );
    });
  }

  void _onCardTap(MenuCardModel card, int index, TabsRouter tabsRouter) {
    if (_animations.controller.isAnimating || _isSelectedCard(card)) {
      return;
    }

    HapticFeedback.mediumImpact();

    setState(() {
      _previousSelectedCard = _selectedCard;
      _selectedCard = card;
      _selectedCardIndex = index;
      _isTitleAnimationTrigger = false;
    });
    _animations.controller.forward();
    _animations.controller.addListener(() {
      if (_animations.controller.value >= 0.6) {
        setState(() {
          final searchedIndex = _deckOrder.indexWhere((c) => c == card.id);
          tabsRouter.setActiveIndex(searchedIndex);
        });
      }
    });

    Future.delayed(_pageChangingDuration).then((_) {
      setState(() {
        _isTitleAnimationTrigger = true;
        _visibleTitle = card.getName(context);
      });
    });
  }

  void _onProfileTap() {
    context.router.push(const ProfileRoute());
  }
}

extension on MenuCardModel {
  IconData get icon {
    return switch (id) {
      _HomeScreenState._dailyCardId => Icons.calendar_month,
      _HomeScreenState._cardsCatalogId => Icons.celebration,
      _HomeScreenState._yesNoId => Icons.food_bank,
      _ => Icons.face,
    };
  }

  String getName(BuildContext context) {
    final l10n = context.l10n;
    return switch (id) {
      _HomeScreenState._dailyCardId => l10n.homeScreen$Menu$DailyCard,
      _HomeScreenState._cardsCatalogId => l10n.homeScreen$Menu$CardsCatalog,
      _HomeScreenState._yesNoId => l10n.homeScreen$Menu$YesNo,
      _ => '',
    };
  }
}
