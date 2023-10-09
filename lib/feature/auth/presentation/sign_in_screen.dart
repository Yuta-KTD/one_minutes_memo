import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:one_minutes_memo/constant/text_const.dart';
import 'package:one_minutes_memo/feature/auth/presentation/controller/sign_in_controller.dart';
import 'package:one_minutes_memo/ui/component/button/loading_button.dart';
import 'package:one_minutes_memo/ui/component/button/primary_button.dart';
import 'package:one_minutes_memo/ui/component/simple_text.dart';
import 'package:one_minutes_memo/util/async_value_ui.dart';

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
      signInControllerAsyncProvider,
      (_, state) => state.showSnackbarOnError(context),
    );
    final signInControllerAsyncValue = ref.watch(signInControllerAsyncProvider);
    return Scaffold(
      appBar: AppBar(
        title: const SimpleText(TextConst.signInTitle),
      ),
      body: Center(
        child: Column(
          children: [
            Form(
              key: _signInFormKey,
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
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    final signInController = ref.read(signInControllerAsyncProvider.notifier);
    await signInController.signIn(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
