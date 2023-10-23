import 'package:flutter/material.dart';

/// TextScaleFactorの最大値を調整するWidget
/// 参考: https://developers.cyberagent.co.jp/blog/archives/36310/
class TextScaleFactor extends StatelessWidget {
  const TextScaleFactor({
    super.key,
    required this.child,
  });

  static const _maxTextScaleFactor = 1.5;
  static const _midLTextScaleFactor = 1.3;
  static const _midSTextScaleFactor = 1.2;
  static const _minTextScaleFactor = 1.1;
  static const _minDeviceSizeWidth = 320.0;
  static const _midDeviceSizeWidth = 350.0;
  static const _maxDeviceSizeWidth = 485.0;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    // TextScaleFactorの最大値
    // 485px以上：1.5
    // 350以上 ~ 485px未満：1.3
    // 320以上 ~ 350px未満：1.2
    // 320px未満：1.1
    final screenWidthSize = MediaQuery.of(context).size.width;
    double upperTextScaleFactor;

    if (screenWidthSize >= _maxDeviceSizeWidth) {
      upperTextScaleFactor = _maxTextScaleFactor;
    } else if (screenWidthSize >= _midDeviceSizeWidth) {
      upperTextScaleFactor = _midLTextScaleFactor;
    } else if (screenWidthSize >= _minDeviceSizeWidth) {
      upperTextScaleFactor = _midSTextScaleFactor;
    } else {
      upperTextScaleFactor = _minTextScaleFactor;
    }

    final textScaleFactor =
        mediaQuery.textScaleFactor.clamp(1.0, upperTextScaleFactor);

    return MediaQuery(
      data: mediaQuery.copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: child,
    );
  }
}
