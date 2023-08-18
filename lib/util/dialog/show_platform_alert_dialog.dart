import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../ui/component/simple_text.dart';

/// OSごとにダイアログを出し分ける
Future<bool> showPlatformAlertDialog(
    {required BuildContext context,
    required String title,
    String? yesText,
    String? noText,
    required VoidCallback yesCallBack,
    required VoidCallback noCallBack,
    bool? barrierDismissible}) async {
  final String showYesText = yesText ?? 'はい';
  final String showNoText = noText ?? 'いいえ';
  return Platform.isIOS
      ? await showCupertinoDialog(
          context: context,
          barrierDismissible: barrierDismissible ?? false,
          builder: (_) => CupertinoAlertDialog(
            title: SimpleText(title),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: noCallBack,
                child: SimpleText(showNoText),
              ),
              CupertinoDialogAction(
                onPressed: yesCallBack,
                child: SimpleText(showYesText),
              )
            ],
          ),
        )
      : await showDialog(
          context: context,
          barrierDismissible: barrierDismissible ?? false,
          builder: (_) => AlertDialog(
            title: SimpleText(title),
            actions: <Widget>[
              GestureDetector(
                onTap: noCallBack,
                child: SimpleText(showNoText),
              ),
              GestureDetector(
                onTap: yesCallBack,
                child: SimpleText(showYesText),
              )
            ],
          ),
        );
}
