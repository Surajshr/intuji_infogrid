/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/app_logo.png
  AssetGenImage get appLogo =>
      const AssetGenImage('assets/images/app_logo.png');

  /// File path: assets/images/app_name.svg
  String get appName => 'assets/images/app_name.svg';

  /// File path: assets/images/arrow_left.svg
  String get arrowLeft => 'assets/images/arrow_left.svg';

  /// File path: assets/images/arrow_vertical.svg
  String get arrowVertical => 'assets/images/arrow_vertical.svg';

  /// File path: assets/images/auth_background_icon.svg
  String get authBackgroundIcon => 'assets/images/auth_background_icon.svg';

  /// File path: assets/images/copy.svg
  String get copy => 'assets/images/copy.svg';

  /// Directory path: assets/images/dashboard
  $AssetsImagesDashboardGen get dashboard => const $AssetsImagesDashboardGen();

  /// File path: assets/images/footer_content.svg
  String get footerContent => 'assets/images/footer_content.svg';

  /// File path: assets/images/header_container.svg
  String get headerContainer => 'assets/images/header_container.svg';

  /// File path: assets/images/mail_sent.svg
  String get mailSent => 'assets/images/mail_sent.svg';

  /// File path: assets/images/map.png
  AssetGenImage get map => const AssetGenImage('assets/images/map.png');

  /// Directory path: assets/images/members
  $AssetsImagesMembersGen get members => const $AssetsImagesMembersGen();

  /// File path: assets/images/person.png
  AssetGenImage get person => const AssetGenImage('assets/images/person.png');

  /// Directory path: assets/images/products
  $AssetsImagesProductsGen get products => const $AssetsImagesProductsGen();

  /// File path: assets/images/search_icon.svg
  String get searchIcon => 'assets/images/search_icon.svg';

  /// File path: assets/images/something_went_wrong.png
  AssetGenImage get somethingWentWrong =>
      const AssetGenImage('assets/images/something_went_wrong.png');

  /// File path: assets/images/trending_up_line.svg
  String get trendingUpLine => 'assets/images/trending_up_line.svg';

  /// List of all assets
  List<dynamic> get values => [
    appLogo,
    appName,
    arrowLeft,
    arrowVertical,
    authBackgroundIcon,
    copy,
    footerContent,
    headerContainer,
    mailSent,
    map,
    person,
    searchIcon,
    somethingWentWrong,
    trendingUpLine,
  ];
}

class $AssetsImagesDashboardGen {
  const $AssetsImagesDashboardGen();

  /// File path: assets/images/dashboard/dashboard.svg
  String get dashboard => 'assets/images/dashboard/dashboard.svg';

  /// File path: assets/images/dashboard/member.svg
  String get member => 'assets/images/dashboard/member.svg';

  /// File path: assets/images/dashboard/more.svg
  String get more => 'assets/images/dashboard/more.svg';

  /// File path: assets/images/dashboard/order.svg
  String get order => 'assets/images/dashboard/order.svg';

  /// List of all assets
  List<String> get values => [dashboard, member, more, order];
}

class $AssetsImagesMembersGen {
  const $AssetsImagesMembersGen();

  /// File path: assets/images/members/member1.png
  AssetGenImage get member1 =>
      const AssetGenImage('assets/images/members/member1.png');

  /// File path: assets/images/members/member2.png
  AssetGenImage get member2 =>
      const AssetGenImage('assets/images/members/member2.png');

  /// File path: assets/images/members/member3.png
  AssetGenImage get member3 =>
      const AssetGenImage('assets/images/members/member3.png');

  /// File path: assets/images/members/member4.png
  AssetGenImage get member4 =>
      const AssetGenImage('assets/images/members/member4.png');

  /// File path: assets/images/members/member5.png
  AssetGenImage get member5 =>
      const AssetGenImage('assets/images/members/member5.png');

  /// File path: assets/images/members/member6.png
  AssetGenImage get member6 =>
      const AssetGenImage('assets/images/members/member6.png');

  /// File path: assets/images/members/member7.png
  AssetGenImage get member7 =>
      const AssetGenImage('assets/images/members/member7.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    member1,
    member2,
    member3,
    member4,
    member5,
    member6,
    member7,
  ];
}

class $AssetsImagesProductsGen {
  const $AssetsImagesProductsGen();

  /// File path: assets/images/products/product1.png
  AssetGenImage get product1 =>
      const AssetGenImage('assets/images/products/product1.png');

  /// File path: assets/images/products/product2.jpg
  AssetGenImage get product2 =>
      const AssetGenImage('assets/images/products/product2.jpg');

  /// File path: assets/images/products/product3.jpg
  AssetGenImage get product3 =>
      const AssetGenImage('assets/images/products/product3.jpg');

  /// File path: assets/images/products/product4.jpg
  AssetGenImage get product4 =>
      const AssetGenImage('assets/images/products/product4.jpg');

  /// File path: assets/images/products/product5.jpg
  AssetGenImage get product5 =>
      const AssetGenImage('assets/images/products/product5.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
    product1,
    product2,
    product3,
    product4,
    product5,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
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
