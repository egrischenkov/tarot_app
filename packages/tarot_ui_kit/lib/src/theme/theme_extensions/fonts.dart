import 'package:flutter/material.dart';

@immutable
class UiKitFonts extends ThemeExtension<UiKitFonts> {
  // TODO(egrischenkov): remove it when the onboarding screen will be ready
  final TextStyle testStyle;
  final TextStyle headlineLarge;

  final TextStyle largeTitleEmphasized;
  final TextStyle largeTitleRegular;
  final TextStyle headlineRegular;
  final TextStyle bodyRegular;
  final TextStyle bodyEmphasized;
  final TextStyle bodyEmphasizedItalic;
  final TextStyle xsLabel;

  const UiKitFonts({
    required this.testStyle,
    required this.headlineLarge,
    required this.largeTitleEmphasized,
    required this.largeTitleRegular,
    required this.headlineRegular,
    required this.bodyRegular,
    required this.bodyEmphasized,
    required this.bodyEmphasizedItalic,
    required this.xsLabel,
  });

  @override
  UiKitFonts copyWith({
    TextStyle? testStyle,
    TextStyle? headlineLarge,
    TextStyle? largeTitleEmphasized,
    TextStyle? largeTitleRegular,
    TextStyle? headlineRegular,
    TextStyle? bodyRegular,
    TextStyle? bodyEmphasized,
    TextStyle? bodyEmphasizedItalic,
    TextStyle? xsLabel,
  }) {
    return UiKitFonts(
      testStyle: testStyle ?? this.testStyle,
      headlineLarge: headlineLarge ?? this.headlineLarge,
      largeTitleEmphasized: largeTitleEmphasized ?? this.largeTitleEmphasized,
      largeTitleRegular: largeTitleRegular ?? this.largeTitleRegular,
      headlineRegular: headlineRegular ?? this.headlineRegular,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      bodyEmphasized: bodyEmphasized ?? this.bodyEmphasized,
      bodyEmphasizedItalic: bodyEmphasizedItalic ?? this.bodyEmphasizedItalic,
      xsLabel: xsLabel ?? this.xsLabel,
    );
  }

  @override
  UiKitFonts lerp(UiKitFonts? other, double t) {
    if (other is! UiKitFonts) {
      return this;
    }
    return UiKitFonts(
      testStyle: TextStyle.lerp(testStyle, other.testStyle, t) ?? other.testStyle,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t) ?? other.headlineLarge,
      largeTitleEmphasized:
          TextStyle.lerp(largeTitleEmphasized, other.largeTitleEmphasized, t) ?? other.largeTitleEmphasized,
      largeTitleRegular: TextStyle.lerp(largeTitleRegular, other.largeTitleRegular, t) ?? other.largeTitleRegular,
      headlineRegular: TextStyle.lerp(headlineRegular, other.headlineRegular, t) ?? other.headlineRegular,
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t) ?? other.bodyRegular,
      bodyEmphasized: TextStyle.lerp(bodyEmphasized, other.bodyEmphasized, t) ?? other.bodyEmphasized,
      bodyEmphasizedItalic:
          TextStyle.lerp(bodyEmphasizedItalic, other.bodyEmphasizedItalic, t) ?? other.bodyEmphasizedItalic,
      xsLabel: TextStyle.lerp(xsLabel, other.xsLabel, t) ?? other.xsLabel,
    );
  }
}
