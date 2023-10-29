import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/constant/text_const.dart';
import 'package:one_minutes_memo/provider/sign_up_controller.dart';
import 'package:one_minutes_memo/view/component/basic_app_bar.dart';
import 'package:one_minutes_memo/view/theme/form_screen_theme.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FormScreenTheme(
      appBar: const BasicAppBar(
        title: TextConst.signUpTitle,
      ),
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'メールアドレス'),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'パスワード'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () => _onPressed(),
                  child: const Text('ユーザー登録'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> _onPressed() async {
    final signUpController = ref.read(signUpAsyncProvider.notifier);
    await signUpController.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
