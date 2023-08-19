import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/router/router.dart';

class OneMinutesMemoApp extends ConsumerWidget {
  const OneMinutesMemoApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // routerConfigでrouterDelegateやbackButtonDispatcherなどをまとめて設定してくれる
      // NOTE: 今後ルーティングで課題が出たらrouterDelegateなどを個別設定する
      routerConfig: goRouter,
    );
  }
}
