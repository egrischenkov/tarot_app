import 'package:flutter/material.dart';

@immutable
class UiKitColors extends ThemeExtension<UiKitColors> {
  // TODO(egrischnekov): Remove when onboarding feature will be ready for development
  final Color grey;
  final Color textUnselected;
  final Color onSurface;
  final Color deepOrange;
  final Color yellow;

  final Color accentOrange;
  final Color accentYellow;
  final Color accentYellowSec;
  final Color accentPurple;
  final Color accentPurpleSec;
  final Color purpleText;
  final Color itsyBitsyBlack;
  final Color greyText;
  final Color whiteText;
  final Color whiteBgWhite;
  final Color whiteBgSecondary;
  final Color blackBgMudberry;
  final Color blackBgPurple;
  final Color goodGreen;
  final Color wrongRed;

  const UiKitColors({
    required this.grey,
    required this.textUnselected,
    required this.onSurface,
    required this.deepOrange,
    required this.yellow,
    required this.accentOrange,
    required this.accentYellow,
    required this.accentYellowSec,
    required this.accentPurple,
    required this.accentPurpleSec,
    required this.purpleText,
    required this.itsyBitsyBlack,
    required this.greyText,
    required this.whiteText,
    required this.whiteBgWhite,
    required this.whiteBgSecondary,
    required this.blackBgMudberry,
    required this.blackBgPurple,
    required this.goodGreen,
    required this.wrongRed,
  });

  @override
  UiKitColors copyWith({
    Color? grey,
    Color? textUnselected,
    Color? onSurface,
    Color? deepOrange,
    Color? yellow,
    Color? accentOrange,
    Color? accentYellow,
    Color? accentYellowSec,
    Color? accentPurple,
    Color? accentPurpleSec,
    Color? purpleText,
    Color? itsyBitsyBlack,
    Color? greyText,
    Color? whiteText,
    Color? whiteBgWhite,
    Color? whiteBgSecondary,
    Color? blackBgMudberry,
    Color? blackBgPurple,
    Color? goodGreen,
    Color? wrongRed,
  }) {
    return UiKitColors(
      grey: grey ?? this.grey,
      textUnselected: textUnselected ?? this.textUnselected,
      onSurface: onSurface ?? this.onSurface,
      deepOrange: deepOrange ?? this.deepOrange,
      yellow: yellow ?? this.yellow,
      accentOrange: accentOrange ?? this.accentOrange,
      accentYellow: accentYellow ?? this.accentYellow,
      accentYellowSec: accentYellowSec ?? this.accentYellowSec,
      accentPurple: accentPurple ?? this.accentPurple,
      accentPurpleSec: accentPurpleSec ?? this.accentPurpleSec,
      purpleText: purpleText ?? this.purpleText,
      itsyBitsyBlack: itsyBitsyBlack ?? this.itsyBitsyBlack,
      greyText: greyText ?? this.greyText,
      whiteText: whiteText ?? this.whiteText,
      whiteBgWhite: whiteBgWhite ?? this.whiteBgWhite,
      whiteBgSecondary: whiteBgSecondary ?? this.whiteBgSecondary,
      blackBgMudberry: blackBgMudberry ?? this.blackBgMudberry,
      blackBgPurple: blackBgPurple ?? this.blackBgPurple,
      goodGreen: goodGreen ?? this.goodGreen,
      wrongRed: wrongRed ?? this.wrongRed,
    );
  }

  @override
  UiKitColors lerp(UiKitColors? other, double t) {
    if (other is! UiKitColors) {
      return this;
    }
    return UiKitColors(
      grey: Color.lerp(grey, other.grey, t) ?? other.grey,
      textUnselected: Color.lerp(textUnselected, other.textUnselected, t) ?? other.textUnselected,
      onSurface: Color.lerp(onSurface, other.onSurface, t) ?? other.onSurface,
      deepOrange: Color.lerp(deepOrange, other.deepOrange, t) ?? other.deepOrange,
      yellow: Color.lerp(yellow, other.yellow, t) ?? other.yellow,
      accentOrange: Color.lerp(accentOrange, other.accentOrange, t) ?? other.accentOrange,
      accentYellow: Color.lerp(accentYellow, other.accentYellow, t) ?? other.accentYellow,
      accentYellowSec: Color.lerp(accentYellowSec, other.accentYellowSec, t) ?? other.accentYellowSec,
      accentPurple: Color.lerp(accentPurple, other.accentPurple, t) ?? other.accentPurple,
      accentPurpleSec: Color.lerp(accentPurpleSec, other.accentPurpleSec, t) ?? other.accentPurpleSec,
      purpleText: Color.lerp(purpleText, other.purpleText, t) ?? other.purpleText,
      itsyBitsyBlack: Color.lerp(itsyBitsyBlack, other.itsyBitsyBlack, t) ?? other.itsyBitsyBlack,
      greyText: Color.lerp(greyText, other.greyText, t) ?? other.greyText,
      whiteText: Color.lerp(whiteText, other.whiteText, t) ?? other.whiteText,
      whiteBgWhite: Color.lerp(whiteText, other.whiteText, t) ?? other.whiteText,
      whiteBgSecondary: Color.lerp(whiteBgSecondary, other.whiteBgSecondary, t) ?? other.whiteBgSecondary,
      blackBgMudberry: Color.lerp(blackBgMudberry, other.blackBgMudberry, t) ?? other.blackBgMudberry,
      blackBgPurple: Color.lerp(blackBgPurple, other.blackBgPurple, t) ?? other.blackBgPurple,
      goodGreen: Color.lerp(goodGreen, other.goodGreen, t) ?? other.goodGreen,
      wrongRed: Color.lerp(wrongRed, other.wrongRed, t) ?? other.wrongRed,
    );
  }
}
