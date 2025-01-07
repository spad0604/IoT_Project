/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAdUnitIdGen {
  const $AssetsAdUnitIdGen();

  /// Directory path: assets/ad_unit_id/dev
  $AssetsAdUnitIdDevGen get dev => const $AssetsAdUnitIdDevGen();

  /// Directory path: assets/ad_unit_id/prod
  $AssetsAdUnitIdProdGen get prod => const $AssetsAdUnitIdProdGen();
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/languages
  $AssetsImagesLanguagesGen get languages => const $AssetsImagesLanguagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// Directory path: assets/images/onboarding
  $AssetsImagesOnboardingGen get onboarding =>
      const $AssetsImagesOnboardingGen();

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsAdUnitIdDevGen {
  const $AssetsAdUnitIdDevGen();

  /// File path: assets/ad_unit_id/dev/ad_id_android.json
  String get adIdAndroid => 'assets/ad_unit_id/dev/ad_id_android.json';

  /// File path: assets/ad_unit_id/dev/ad_id_ios.json
  String get adIdIos => 'assets/ad_unit_id/dev/ad_id_ios.json';

  /// List of all assets
  List<String> get values => [adIdAndroid, adIdIos];
}

class $AssetsAdUnitIdProdGen {
  const $AssetsAdUnitIdProdGen();

  /// File path: assets/ad_unit_id/prod/ad_id_android.json
  String get adIdAndroid => 'assets/ad_unit_id/prod/ad_id_android.json';

  /// File path: assets/ad_unit_id/prod/ad_id_ios.json
  String get adIdIos => 'assets/ad_unit_id/prod/ad_id_ios.json';

  /// List of all assets
  List<String> get values => [adIdAndroid, adIdIos];
}

class $AssetsImagesLanguagesGen {
  const $AssetsImagesLanguagesGen();

  /// File path: assets/images/languages/en.png
  AssetGenImage get en => const AssetGenImage('assets/images/languages/en.png');

  /// File path: assets/images/languages/fr.png
  AssetGenImage get fr => const AssetGenImage('assets/images/languages/fr.png');

  /// File path: assets/images/languages/ge.png
  AssetGenImage get ge => const AssetGenImage('assets/images/languages/ge.png');

  /// File path: assets/images/languages/hi.png
  AssetGenImage get hi => const AssetGenImage('assets/images/languages/hi.png');

  /// File path: assets/images/languages/indonesia.png
  AssetGenImage get indonesia =>
      const AssetGenImage('assets/images/languages/indonesia.png');

  /// File path: assets/images/languages/zh.png
  AssetGenImage get zh => const AssetGenImage('assets/images/languages/zh.png');

  /// List of all assets
  List<AssetGenImage> get values => [en, fr, ge, hi, indonesia, zh];
}

class $AssetsImagesOnboardingGen {
  const $AssetsImagesOnboardingGen();

  /// File path: assets/images/onboarding/onboarding1.png
  AssetGenImage get onboarding1 =>
      const AssetGenImage('assets/images/onboarding/onboarding1.png');

  /// File path: assets/images/onboarding/onboarding2.png
  AssetGenImage get onboarding2 =>
      const AssetGenImage('assets/images/onboarding/onboarding2.png');

  /// File path: assets/images/onboarding/onboarding3.png
  AssetGenImage get onboarding3 =>
      const AssetGenImage('assets/images/onboarding/onboarding3.png');

  /// List of all assets
  List<AssetGenImage> get values => [onboarding1, onboarding2, onboarding3];
}

class Assets {
  Assets._();

  static const $AssetsAdUnitIdGen adUnitId = $AssetsAdUnitIdGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
