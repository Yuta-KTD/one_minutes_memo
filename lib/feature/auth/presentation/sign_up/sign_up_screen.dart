import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/constant/text_const.dart';
import 'package:one_minutes_memo/feature/auth/presentation/sign_up/sign_up_controller.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(TextConst.signUpTitle),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _passwordController,
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
      ),
    );
  }

  Future<void> _onPressed() async {
    final signUpController = ref.read(signUpControllerAsyncProvider.notifier);
    await signUpController.signUp(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
