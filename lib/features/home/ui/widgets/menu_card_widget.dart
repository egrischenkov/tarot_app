import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarot_ui_kit/ui_kit.dart';

class MenuCardWidget extends StatelessWidget {
  final String name;
  final double verticalOffset;
  final double horizontalOffset;
  final double height;
  final double width;
  final double heightFactor;
  final double angle;
  final double yAngle;
  final Widget icon;
  final BorderRadius borderRadius;
  final VoidCallback onTap;
  final Widget backSideWidget;

  const MenuCardWidget({
    required this.name,
    required this.verticalOffset,
    required this.horizontalOffset,
    required this.height,
    required this.width,
    required this.heightFactor,
    required this.angle,
    required this.yAngle,
    required this.borderRadius,
    required this.icon,
    required this.onTap,
    required this.backSideWidget,
    super.key,
  });

  bool get _isFrontSide => yAngle < pi / 2 || yAngle > 3 * pi / 2;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..translate(horizontalOffset, verticalOffset)
        ..rotateY(yAngle),
      child: GestureDetector(
        onTap: onTap,
        child: Transform.rotate(
          angle: angle,
          child: Container(
            width: width,
            height: height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: context.colors.background,
              borderRadius: borderRadius,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  colors.menuCardGradientFirst,
                  colors.menuCardGradientSecond,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: colors.shadow,
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(6, 0),
                ),
                BoxShadow(
                  color: colors.shadow,
                  blurRadius: 6,
                  spreadRadius: 0,
                  offset: const Offset(-2, 0),
                ),
              ],
            ),
            child: Stack(
              children: [
                Visibility(
                  visible: _isFrontSide,
                  child: ClipRect(
                    child: Align(
                      alignment: Alignment.topLeft,
                      heightFactor: heightFactor,
                      child: Padding(
                        padding: const EdgeInsets.all(UiKitSpacing.x3),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            icon,
                            UiKitSpacing.x2.h,
                            Text(
                              name,
                              style: context.fonts.xsLabel.copyWith(
                                fontSize: width * 0.07,
                                fontWeight: FontWeight.bold,
                                color: colors.menuCardContent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !_isFrontSide,
                  child: Transform(
                    alignment: Alignment.topCenter,
                    transform: Matrix4.identity()..rotateY(pi),
                    child: backSideWidget,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
