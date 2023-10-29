import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/provider/sign_in_provider.dart';
import 'package:one_minutes_memo/util/async_value_ui.dart';
import 'package:one_minutes_memo/view/component/button/loading_button.dart';
import 'package:one_minutes_memo/view/component/button/primary_button.dart';
import 'package:one_minutes_memo/view/theme/form_screen_theme.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _signInFormKey = GlobalKey<FormState>();
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
    ref.listen<AsyncValue<void>>(
      signInAsyncProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final signInControllerAsyncValue = ref.watch(signInAsyncProvider);
    return FormScreenTheme(
      children: [
        Form(
          key: _signInFormKey,
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
                child: LoadingButton(
                  onPressed: () => _onPressed(),
                  text: 'ログイン',
                  isLoading: signInControllerAsyncValue.isLoading,
                ),
              )
            ],
          ),
        ),
        PrimaryButton(
          onPressed: () => context.go('/signup'),
          text: '会員登録はこちらから',
        ),
      ],
    );
  }

  Future<void> _onPressed() async {
    final signInController = ref.read(signInAsyncProvider.notifier);
    await signInController.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
