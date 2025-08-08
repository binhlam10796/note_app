/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();

  static const AssetGenImage images = AssetGenImage();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage();
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/pokeball.svg
  SvgGenImage get pokeball => const SvgGenImage('assets/svgs/pokeball.svg');

  /// File path: assets/svgs/type_fire.svg
  SvgGenImage get typeFire => const SvgGenImage('assets/svgs/type_fire.svg');

  /// File path: assets/svgs/type_water.svg
  SvgGenImage get typeWater => const SvgGenImage('assets/svgs/type_water.svg');

  /// List of all assets
  List<SvgGenImage> get values => [pokeball, typeFire, typeWater];
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
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
    Clip clipBehavior = Clip.hardEdge,
    ColorFilter? colorFilter,
    @Deprecated('Use colorFilter instead') Color? color,
    @Deprecated('Use colorFilter instead') BlendMode colorBlendMode = BlendMode.srcIn,
    String? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      colorFilter: colorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;

  @override
  String toString() => _assetName;
}
