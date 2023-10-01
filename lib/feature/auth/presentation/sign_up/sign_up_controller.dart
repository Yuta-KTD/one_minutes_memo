import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/feature/auth/domain/local_user.dart';
import 'package:one_minutes_memo/feature/auth/repository/auth_repository_impl.dart';

class SignUpController extends AutoDisposeAsyncNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> signUp(
      {required String email,
      required String password,
      String? userName}) async {
    final authRepository = ref.read(authRepositoryProvider);
    final signUpParam =
        LocalUser(password: password, email: email, userName: userName);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signUp(signUpParam));
  }
}