import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/model/local_user.dart';
import 'package:one_minutes_memo/repository/auth_repository_impl.dart';

class SignInAsyncNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signIn(
      {required String email,
      required String password,
      String? userName}) async {
    final authRepository = ref.read(authRepositoryProvider);
    final signInParam = LocalUser(password: password, email: email);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signIn(signInParam));
  }
}

final signInAsyncProvider =
    AsyncNotifierProvider.autoDispose<SignInAsyncNotifier, void>(() {
  return SignInAsyncNotifier();
});
