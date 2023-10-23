import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/router/router.dart';
import 'package:one_minutes_memo/util/text_scale_factor.dart';

class OneMinutesMemoApp extends ConsumerWidget {
  const OneMinutesMemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      builder: (context, child) => TextScaleFactor(child: child ?? Container()),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // routerConfigでrouterDelegateやbackButtonDispatcherなどをまとめて設定してくれる
      // NOTE: 今後ルーティングで課題が出たらrouterDelegateなどを個別設定する
      routerConfig: goRouter,
    );
  }
}
