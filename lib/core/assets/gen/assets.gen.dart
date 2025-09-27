/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsAppIconsGen {
  const $AssetsAppIconsGen();

  /// File path: assets/app_icons/android_app_icon.png
  AssetGenImage get androidAppIcon => const AssetGenImage('assets/app_icons/android_app_icon.png');

  /// File path: assets/app_icons/android_foreground.png
  AssetGenImage get androidForeground => const AssetGenImage('assets/app_icons/android_foreground.png');

  /// File path: assets/app_icons/ios_app_icon.png
  AssetGenImage get iosAppIcon => const AssetGenImage('assets/app_icons/ios_app_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [androidAppIcon, androidForeground, iosAppIcon];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/about_icon.svg
  SvgGenImage get aboutIcon => const SvgGenImage('assets/icons/about_icon.svg');

  /// File path: assets/icons/ava_1.svg
  SvgGenImage get ava1 => const SvgGenImage('assets/icons/ava_1.svg');

  /// Directory path: assets/icons/menu
  $AssetsIconsMenuGen get menu => const $AssetsIconsMenuGen();

  /// File path: assets/icons/onboarding_1.svg
  SvgGenImage get onboarding1 => const SvgGenImage('assets/icons/onboarding_1.svg');

  /// File path: assets/icons/onboarding_2.svg
  SvgGenImage get onboarding2 => const SvgGenImage('assets/icons/onboarding_2.svg');

  /// File path: assets/icons/settings.svg
  SvgGenImage get settings => const SvgGenImage('assets/icons/settings.svg');

  /// File path: assets/icons/share.svg
  SvgGenImage get share => const SvgGenImage('assets/icons/share.svg');

  /// List of all assets
  List<SvgGenImage> get values => [aboutIcon, ava1, onboarding1, onboarding2, settings, share];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/coming_soon.json
  String get comingSoon => 'assets/lottie/coming_soon.json';

  /// File path: assets/lottie/onboarding_bg_1.json
  String get onboardingBg1 => 'assets/lottie/onboarding_bg_1.json';

  /// File path: assets/lottie/onboarding_bg_2.json
  String get onboardingBg2 => 'assets/lottie/onboarding_bg_2.json';

  /// File path: assets/lottie/onboarding_bg_3.json
  String get onboardingBg3 => 'assets/lottie/onboarding_bg_3.json';

  /// File path: assets/lottie/sandy_loading.json
  String get sandyLoading => 'assets/lottie/sandy_loading.json';

  /// File path: assets/lottie/sign_up.json
  String get signUp => 'assets/lottie/sign_up.json';

  /// File path: assets/lottie/sun_breathing.json
  String get sunBreathing => 'assets/lottie/sun_breathing.json';

  /// List of all assets
  List<String> get values => [
        comingSoon,
        onboardingBg1,
        onboardingBg2,
        onboardingBg3,
        sandyLoading,
        signUp,
        sunBreathing,
      ];
}

class $AssetsSplashImageGen {
  const $AssetsSplashImageGen();

  /// File path: assets/splash_image/splash.png
  AssetGenImage get splash => const AssetGenImage('assets/splash_image/splash.png');

  /// List of all assets
  List<AssetGenImage> get values => [splash];
}

class $AssetsIconsMenuGen {
  const $AssetsIconsMenuGen();

  /// File path: assets/icons/menu/crystal_ball.svg
  SvgGenImage get crystalBall => const SvgGenImage('assets/icons/menu/crystal_ball.svg');

  /// File path: assets/icons/menu/tarot_card.svg
  SvgGenImage get tarotCard => const SvgGenImage('assets/icons/menu/tarot_card.svg');

  /// File path: assets/icons/menu/tarot_cards.svg
  SvgGenImage get tarotCards => const SvgGenImage('assets/icons/menu/tarot_cards.svg');

  /// List of all assets
  List<SvgGenImage> get values => [crystalBall, tarotCard, tarotCards];
}

class Assets {
  const Assets._();

  static const $AssetsAppIconsGen appIcons = $AssetsAppIconsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
  static const $AssetsSplashImageGen splashImage = $AssetsSplashImageGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(_assetName, assetBundle: bundle, packageName: package, theme: theme);
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
