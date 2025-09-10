import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  late final HomeScreenAnimations _animations;
  late double _cardWidth;
  late double _cardHeight;

  late var _selectedCard = _menuCards.first;
  int _selectedCardIndex = 0;
  MenuCardModel? _previousSelectedCard;

  final _menuCards = [
    MenuCardModel(id: 'daily_card'),
    MenuCardModel(id: 'spreads'),
    MenuCardModel(id: 'funny'),
    MenuCardModel(id: 'yammy'),
  ];

  final List<String> _deckOrder = [
    'daily_card',
    'spreads',
    'funny',
    'yammy',
  ];

  bool _isStackReordered = false;

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

    return Scaffold(
      body: AutoTabsRouter(
        duration: const Duration(milliseconds: 400),
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          child: child,
        ),
        routes: const [
          DailyCardRoute(),
          DecksRoute(),
          FunnyRoute(),
          YammyRoute(),
        ],
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Padding(
            padding: const EdgeInsets.only(top: kToolbarHeight),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: UiKitAppBar.height,
                    color: colors.background,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Hero(
                          tag: ProfileWidget.heroTag,
                          child: ProfileWidget(
                            onTap: _onProfileTap,
                            child: Assets.icons.ava1.svg(
                              height: 64,
                              width: 64,
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
                      top: UiKitAppBar.height,
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
  }

  void _onProfileTap() {
    context.router.push(const ProfileRoute());
  }
}

extension on MenuCardModel {
  IconData get icon {
    return switch (id) {
      'daily_card' => Icons.calendar_month,
      'funny' => Icons.celebration,
      'yammy' => Icons.food_bank,
      'spreads' => Icons.card_giftcard,
      _ => Icons.face,
    };
  }

  String getName(BuildContext context) {
    final l10n = context.l10n;
    return switch (id) {
      'daily_card' => l10n.homeScreen$MenuDailyCard,
      'funny' => l10n.homeScreen$MenuFunny,
      'yammy' => l10n.homeScreen$MenuYammy,
      'spreads' => l10n.homeScreen$MenuSpreads,
      _ => '',
    };
  }
}
