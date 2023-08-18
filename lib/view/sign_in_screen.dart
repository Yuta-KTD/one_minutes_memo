import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/constant/text_const.dart';

import '../ui/component/simple_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(TextConst.signInTitle),
      ),
      body: Center(
        child: TextButton(
          child: const SimpleText('メモを追加'),
          onPressed: () => context.go('/title'),
        ),
      ),
    );
  }
}
