import 'package:flutter/material.dart';
import 'package:one_minutes_memo/constant/text_const.dart';

import '../ui/component/simple_text.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(TextConst.signUpTitle),
      ),
    );
  }
}
