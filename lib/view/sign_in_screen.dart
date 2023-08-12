import 'package:flutter/material.dart';
import 'package:one_minutes_memo/constant/text_const.dart';

import '../ui/component/simple_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(text: TextConst.signInTitle),
      ),
    );
  }
}
