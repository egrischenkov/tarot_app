import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:taro/core/extensions/context_extension.dart';
import 'package:taro/core/utils/map_with_index.dart';
import 'package:taro/features/home/domain/entities/menu_card_model.dart';
import 'package:taro/features/home/ui/widgets/menu_card_widget.dart';
import 'package:taro/features/home/ui/widgets/profile_widget.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

const _appBarHeight = 120.0;

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  late final Animation<double> _moveToCenterAnimation;
  late final Animation<double> _shiftCardsAnimation;
  late final Animation<double> _expandAnimation;
  late final Animation<double> _returnBackAnimation;
  late final Animation<double> _resizeBackAnimation;
  late final Animation<double> _rotationAnimation;

  late final double _cardWidth;
  late final double _cardHeight;

  late final _selectedCard = _menuCards.first;
  int _selectedCardIndex = 0;

  MenuCardModel? _previousSelectedCard;

  /// Menu items
  ///
  /// Cards order is matter
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

  @override
  void initState() {
    super.initState();

    _initAnimations();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final screenWidth = MediaQuery.of(context).size.width;
    _cardWidth = screenWidth * 0.4;
    _cardHeight = _cardWidth * 1.5;
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  bool _isSelectedCard(MenuCardModel card) => _selectedCard.id == card.id;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: _appBarHeight,
              color: colors.whiteBgWhite,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ProfileWidget()],
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, _) {
              return Positioned.fill(
                top: _appBarHeight,
                child: Stack(
                  children: _menuCards.mapWithIndex((index, card, _, __) {
                    final values = _getAnimationValues(index: index, card: card);

                    return MenuCardWidget(
                      name: card.getName(context),
                      verticalOffset: values.verticalOffset,
                      horizontalOffset: values.horizontalOffset,
                      height: values.height,
                      width: values.width,
                      heightFactor: values.heightFactor,
                      angle: values.angle,
                      yAngle: values.yAngle,
                      borderRadius: BorderRadius.circular(24),
                      icon: Icon(
                        card.icon,
                        color: Colors.blueAccent,
                      ),
                      onTap: () {},
                    );
                  }).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _initAnimations() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 650))
      ..addListener(_animationHooks)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _animationController.reset();
        }
      });

    _moveToCenterAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0, .5, curve: Curves.easeIn),
      ),
    );

    _shiftCardsAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.15, 0.7, curve: Curves.easeInOut),
      ),
    );

    _expandAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.55, 1, curve: Curves.easeIn),
      ),
    );

    _returnBackAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.25, 0.85, curve: Curves.easeIn),
      ),
    );

    _resizeBackAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
      ),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.5, curve: Curves.easeIn),
      ),
    );
  }

  ({
    double verticalOffset,
    double horizontalOffset,
    double height,
    double width,
    double heightFactor,
    double angle,
    double yAngle,
  }) _getAnimationValues({required int index, required MenuCardModel card}) {
    final isSelected = _isSelectedCard(card);
    final isPreviouslySelected = !isSelected && card.id == _previousSelectedCard?.id;

    const baseAngle = -0.12;
    const angleStep = 0.12;
    final baseVerticalOffset = MediaQuery.of(context).size.height - _cardHeight * 0.9;

    final double defaultVertical = baseVerticalOffset + (index - 1) * 3;
    final double defaultHorizontal = (_cardWidth / 2) * (index - 1) + 32;
    final double defaultAngle = baseAngle + (angleStep * (index - 1));
    final double defaultCardWidth = _cardWidth;
    final double defaultCardHeight = _cardHeight;
    const double defaultHeightFactor = 0.33;

    if (_animationController.isAnimating) {
      if (_previousSelectedCard?.id case final previousCardId?) {
        final isRepositionAnimationAvailable = !isSelected && !isPreviouslySelected && !_isStackReordered;

        final previousCardDeckIndex = _deckOrder.indexOf(previousCardId);
        final currentCardDeckIndex = _deckOrder.indexOf(card.id);

        final isNeedToShiftLeft = index >= _selectedCardIndex && currentCardDeckIndex <= previousCardDeckIndex;
        final isNeedToShiftRight = index <= _selectedCardIndex && currentCardDeckIndex >= previousCardDeckIndex;
        if (isRepositionAnimationAvailable && isNeedToShiftLeft) {
          card.verticalOffset = lerpDouble(
            card.verticalOffset ?? defaultVertical,
            baseVerticalOffset + (index - 2) * 3,
            _shiftCardsAnimation.value,
          );

          card.horizontalOffset = lerpDouble(
            card.horizontalOffset ?? defaultHorizontal,
            (_cardWidth / 2) * (index - 2) + 16,
            _shiftCardsAnimation.value,
          )!;

          card.angle = lerpDouble(
            card.angle ?? defaultAngle,
            baseAngle + (angleStep * (index - 2)),
            _shiftCardsAnimation.value,
          );
        }

        if (isRepositionAnimationAvailable && isNeedToShiftRight) {
          card.verticalOffset = lerpDouble(
            card.verticalOffset ?? defaultVertical,
            baseVerticalOffset + index * 3,
            _shiftCardsAnimation.value,
          );

          card.horizontalOffset = lerpDouble(
            card.horizontalOffset ?? defaultHorizontal,
            (_cardWidth / 2) * index + 16,
            _shiftCardsAnimation.value,
          )!;

          card.angle = lerpDouble(
            card.angle ?? defaultAngle,
            baseAngle + (angleStep * index),
            _shiftCardsAnimation.value,
          );
        }
      }

      if (isSelected) {
        card.verticalOffset = lerpDouble(defaultVertical, 0, _animationController.value);

        card.horizontalOffset = _animationController.value >= .5
            ? lerpDouble(MediaQuery.of(context).size.width / 2 - _cardWidth / 2, 0, _expandAnimation.value)
            : lerpDouble(
                defaultHorizontal,
                MediaQuery.of(context).size.width / 2 - _cardWidth / 2,
                _moveToCenterAnimation.value,
              );

        card.width = lerpDouble(
          defaultCardWidth,
          MediaQuery.of(context).size.width,
          _expandAnimation.value,
        );
        card.height = lerpDouble(
          defaultCardHeight,
          MediaQuery.of(context).size.height,
          _expandAnimation.value,
        );
        card.heightFactor = lerpDouble(0.33, 1.0, _expandAnimation.value) ?? 0.33;
        card.angle = lerpDouble(defaultAngle, 0, _moveToCenterAnimation.value);
        card.yAngle = lerpDouble(0.0, pi, _rotationAnimation.value);
      }

      // Возврат предыдущей карты в её позицию
      if (isPreviouslySelected) {
        final targetIndex = _menuCards.indexWhere((c) => c.id == card.id);
        final returningVertical =
            _isStackReordered ? baseVerticalOffset + (targetIndex - 1) * 3 : MediaQuery.of(context).size.height;
        final returningHorizontal =
            _isStackReordered ? (_cardWidth / 2) * (targetIndex - 1) + 16 : MediaQuery.of(context).size.width;
        final returningAngle = _isStackReordered ? baseAngle + (angleStep * (targetIndex - 1)) : baseAngle + angleStep;

        card.verticalOffset = lerpDouble(
          card.verticalOffset ?? 0,
          returningVertical,
          _returnBackAnimation.value,
        );
        card.horizontalOffset = lerpDouble(
          card.horizontalOffset ?? 0,
          returningHorizontal,
          _returnBackAnimation.value,
        )!;
        card.angle = lerpDouble(card.angle ?? 0, returningAngle, _returnBackAnimation.value);
        card.yAngle = card.yAngle = lerpDouble(pi, 0, _rotationAnimation.value);
        card.width = lerpDouble(
          MediaQuery.of(context).size.width,
          defaultCardWidth,
          _resizeBackAnimation.value,
        );
        card.height = lerpDouble(
          MediaQuery.of(context).size.height,
          defaultCardHeight,
          _resizeBackAnimation.value,
        );
        card.heightFactor = lerpDouble(1.0, 0.33, _returnBackAnimation.value) ?? 0.33;
      }
    } else if (isSelected) {
      card.verticalOffset = 0;
      card.horizontalOffset = 0;
      card.angle = 0;
      card.width = MediaQuery.of(context).size.width;
      card.height = MediaQuery.of(context).size.height;
      card.heightFactor = 1;
    }

    return (
      verticalOffset: card.verticalOffset ?? defaultVertical,
      horizontalOffset: card.horizontalOffset ?? defaultHorizontal,
      height: card.height ?? defaultCardHeight,
      width: card.width ?? defaultCardWidth,
      heightFactor: card.heightFactor ?? defaultHeightFactor,
      angle: card.angle ?? defaultAngle,
      yAngle: card.yAngle ?? 0,
    );
  }

  bool _isStackReordered = false;

  void _animationHooks() {
    if (_animationController.value >= 0.7 && !_isStackReordered) {
      _changeStackOrder();
      _isStackReordered = true;
    } else if (_animationController.value < 0.7) {
      _isStackReordered = false;
    }
  }

  void _changeStackOrder() {
    setState(() {
      final selectedCard = _menuCards.removeAt(_selectedCardIndex);
      _menuCards.insert(0, selectedCard);

      // фишка в том что предыдущая выбранная карта должна быть под всеми
      // но в случае если выбрана первая карта, и выбрать вторую.
      // то выбранная первая займет свое место согласно константному порядку и окажется под выбранной второй

      // Решить:
      // надо сравнить индекс предыдущей карты с индексами оставшихся, и расположить соответственно

      if (_previousSelectedCard != null) {
        final index = _menuCards.indexWhere((c) => c.id == _previousSelectedCard!.id);
        if (index != -1) {
          final cardToReinsert = _menuCards.removeAt(index);
          final cardToReinsertDeckIndex = _deckOrder.indexOf(cardToReinsert.id);

          var searchedIndex = _menuCards.length - 1;
          for (final card in _menuCards.skip(1)) {
            final deckIndex = _deckOrder.indexOf(card.id);

            if (cardToReinsertDeckIndex < deckIndex) {
              searchedIndex = _menuCards.indexWhere((c) => c.id == card.id);
              break;
            }
          }

          _menuCards.insert(searchedIndex, cardToReinsert);
        }
      }
    });
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
