import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:taro/features/home/domain/entities/menu_card_model.dart';

import '../animations/home_screen_animations.dart';

typedef CalculationValues = ({
  double verticalOffset,
  double horizontalOffset,
  double height,
  double width,
  double heightFactor,
  double angle,
  double yAngle,
});

/// Calculates all UI animation values (position, size, rotation, etc.)
/// for each card based on its current state: selected, previously selected, or idle.
///
/// Takes into account the stack reorder flag to determine final position values.
class CardAnimationCalculator {
  final BuildContext context;
  final HomeScreenAnimations animations;
  final double cardWidth;
  final double cardHeight;
  final int selectedCardIndex;
  final MenuCardModel selectedCard;
  final MenuCardModel? previousSelectedCard;
  final List<MenuCardModel> menuCards;
  final List<String> deckOrder;
  final bool isStackReordered;

  CardAnimationCalculator({
    required this.context,
    required this.animations,
    required this.cardWidth,
    required this.cardHeight,
    required this.selectedCardIndex,
    required this.selectedCard,
    required this.previousSelectedCard,
    required this.menuCards,
    required this.deckOrder,
    required this.isStackReordered,
  });

  bool _isSelected(MenuCardModel card) => selectedCard.id == card.id;

  CalculationValues calculate(int index, MenuCardModel card) {
    final isSelected = _isSelected(card);
    final isPreviouslySelected = !isSelected && card.id == previousSelectedCard?.id;

    const baseAngle = -0.12;
    const angleStep = 0.12;
    const heightFactorDefault = 0.33;
    final screen = MediaQuery.of(context).size;

    final baseVerticalOffset = screen.height - cardHeight * .8;

    final defaultVertical = baseVerticalOffset + (index - 1) * 3;
    final defaultHorizontal = (cardWidth / 2) * (index - 1) + 32;
    final defaultAngle = baseAngle + (angleStep * (index - 1));

    if (animations.controller.isAnimating) {
      if (previousSelectedCard?.id case final previousId?) {
        final reposition = !isSelected && !isPreviouslySelected && !isStackReordered;
        final previousDeckIndex = deckOrder.indexOf(previousId);
        final currentDeckIndex = deckOrder.indexOf(card.id);

        final shiftLeft = index >= selectedCardIndex && currentDeckIndex <= previousDeckIndex;
        final shiftRight = index <= selectedCardIndex && currentDeckIndex >= previousDeckIndex;

        if (reposition && shiftLeft) {
          card.verticalOffset = lerpDouble(
            card.verticalOffset ?? defaultVertical,
            baseVerticalOffset + (index - 2) * 3,
            animations.shiftCards.value,
          );
          card.horizontalOffset = lerpDouble(
            card.horizontalOffset ?? defaultHorizontal,
            (cardWidth / 2) * (index - 2) + 16,
            animations.shiftCards.value,
          );
          card.angle = lerpDouble(
            card.angle ?? defaultAngle,
            baseAngle + (angleStep * (index - 2)),
            animations.shiftCards.value,
          );
        }

        if (reposition && shiftRight) {
          card.verticalOffset = lerpDouble(
            card.verticalOffset ?? defaultVertical,
            baseVerticalOffset + index * 3,
            animations.shiftCards.value,
          );
          card.horizontalOffset = lerpDouble(
            card.horizontalOffset ?? defaultHorizontal,
            (cardWidth / 2) * index + 16,
            animations.shiftCards.value,
          );
          card.angle = lerpDouble(
            card.angle ?? defaultAngle,
            baseAngle + (angleStep * index),
            animations.shiftCards.value,
          );
        }
      }

      if (isSelected) {
        card.verticalOffset = lerpDouble(
          defaultVertical,
          0,
          animations.controller.value,
        );
        card.horizontalOffset = animations.controller.value >= .5
            ? lerpDouble(
                screen.width / 2 - cardWidth / 2,
                0,
                animations.expand.value,
              )
            : lerpDouble(
                defaultHorizontal,
                screen.width / 2 - cardWidth / 2,
                animations.moveToCenter.value,
              );

        card.width = lerpDouble(
          cardWidth,
          screen.width,
          animations.expand.value,
        );
        card.height = lerpDouble(
          cardHeight,
          screen.height,
          animations.expand.value,
        );
        card.heightFactor = lerpDouble(
              0.33,
              1.0,
              animations.expand.value,
            ) ??
            0.33;
        card.angle = lerpDouble(
          defaultAngle,
          0,
          animations.moveToCenter.value,
        );
        card.yAngle = lerpDouble(
          0.0,
          pi,
          animations.rotation.value,
        );
      }

      if (isPreviouslySelected) {
        final targetIndex = menuCards.indexWhere((c) => c.id == card.id);
        final returningVertical = isStackReordered ? baseVerticalOffset + (targetIndex - 1) * 3 : screen.height;
        final returningHorizontal = isStackReordered ? (cardWidth / 2) * (targetIndex - 1) + 16 : screen.width;
        final returningAngle = isStackReordered ? baseAngle + (angleStep * (targetIndex - 1)) : baseAngle + angleStep;

        card.verticalOffset = lerpDouble(
          card.verticalOffset ?? 0,
          returningVertical,
          animations.returnBack.value,
        );
        card.horizontalOffset = lerpDouble(
          card.horizontalOffset ?? 0,
          returningHorizontal,
          animations.returnBack.value,
        );
        card.angle = lerpDouble(
          card.angle ?? 0,
          returningAngle,
          animations.returnBack.value,
        );
        card.yAngle = lerpDouble(
          pi,
          0,
          animations.rotation.value,
        );
        card.width = lerpDouble(
          screen.width,
          cardWidth,
          animations.resizeBack.value,
        );
        card.height = lerpDouble(
          screen.height,
          cardHeight,
          animations.resizeBack.value,
        );
        card.heightFactor = lerpDouble(
              1.0,
              0.33,
              animations.returnBack.value,
            ) ??
            0.33;
      }
      // Initially selected card properties
    } else if (isSelected) {
      card.verticalOffset = 0;
      card.horizontalOffset = 0;
      card.angle = 0;
      card.width = screen.width;
      card.height = screen.height;
      card.heightFactor = 1;
      card.yAngle = pi;
    }

    return (
      verticalOffset: card.verticalOffset ?? defaultVertical,
      horizontalOffset: card.horizontalOffset ?? defaultHorizontal,
      height: card.height ?? cardHeight,
      width: card.width ?? cardWidth,
      heightFactor: card.heightFactor ?? heightFactorDefault,
      angle: card.angle ?? defaultAngle,
      yAngle: card.yAngle ?? 0,
    );
  }
}
