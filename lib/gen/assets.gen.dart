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

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/aron.png
  AssetGenImage get aron => const AssetGenImage('assets/svgs/aron.png');

  /// File path: assets/svgs/arrow_back.svg
  SvgGenImage get arrowBack => const SvgGenImage('assets/svgs/arrow_back.svg');

  /// File path: assets/svgs/bulbasaur.png
  AssetGenImage get bulbasaur =>
      const AssetGenImage('assets/svgs/bulbasaur.png');

  /// File path: assets/svgs/butterfree.png
  AssetGenImage get butterfree =>
      const AssetGenImage('assets/svgs/butterfree.png');

  /// File path: assets/svgs/charmander.png
  AssetGenImage get charmander =>
      const AssetGenImage('assets/svgs/charmander.png');

  /// File path: assets/svgs/chevron_left.svg
  SvgGenImage get chevronLeft =>
      const SvgGenImage('assets/svgs/chevron_left.svg');

  /// File path: assets/svgs/chevron_right.svg
  SvgGenImage get chevronRight =>
      const SvgGenImage('assets/svgs/chevron_right.svg');

  /// File path: assets/svgs/close.svg
  SvgGenImage get close => const SvgGenImage('assets/svgs/close.svg');

  /// File path: assets/svgs/ditto.png
  AssetGenImage get ditto => const AssetGenImage('assets/svgs/ditto.png');

  /// File path: assets/svgs/gastly.png
  AssetGenImage get gastly => const AssetGenImage('assets/svgs/gastly.png');

  /// File path: assets/svgs/mew.png
  AssetGenImage get mew => const AssetGenImage('assets/svgs/mew.png');

  /// File path: assets/svgs/pikachu.png
  AssetGenImage get pikachu => const AssetGenImage('assets/svgs/pikachu.png');

  /// File path: assets/svgs/pokeball.svg
  SvgGenImage get pokeball => const SvgGenImage('assets/svgs/pokeball.svg');

  /// File path: assets/svgs/search.svg
  SvgGenImage get search => const SvgGenImage('assets/svgs/search.svg');

  /// File path: assets/svgs/silhouette.png
  AssetGenImage get silhouette =>
      const AssetGenImage('assets/svgs/silhouette.png');

  /// File path: assets/svgs/sort.svg
  SvgGenImage get sort => const SvgGenImage('assets/svgs/sort.svg');

  /// File path: assets/svgs/squirtle.png
  AssetGenImage get squirtle => const AssetGenImage('assets/svgs/squirtle.png');

  /// File path: assets/svgs/straighten.svg
  SvgGenImage get straighten => const SvgGenImage('assets/svgs/straighten.svg');

  /// File path: assets/svgs/tag.svg
  SvgGenImage get tag => const SvgGenImage('assets/svgs/tag.svg');

  /// File path: assets/svgs/text_format.svg
  SvgGenImage get textFormat =>
      const SvgGenImage('assets/svgs/text_format.svg');

  /// File path: assets/svgs/weight.svg
  SvgGenImage get weight => const SvgGenImage('assets/svgs/weight.svg');

  /// List of all assets
  List<dynamic> get values => [
        aron,
        arrowBack,
        bulbasaur,
        butterfree,
        charmander,
        chevronLeft,
        chevronRight,
        close,
        ditto,
        gastly,
        mew,
        pikachu,
        pokeball,
        search,
        silhouette,
        sort,
        squirtle,
        straighten,
        tag,
        textFormat,
        weight
      ];
}

class Assets {
  const Assets._();

  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
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

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

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
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
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
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
