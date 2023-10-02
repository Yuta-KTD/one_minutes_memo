import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:one_minutes_memo/feature/auth/domain/local_user.dart';

class SignInControllerAsyncNotifier extends AutoDisposeAsyncNotifier<void> {
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

final signInControllerAsyncProvider =
    AsyncNotifierProvider.autoDispose<SignInControllerAsyncNotifier, void>(() {
  return SignInControllerAsyncNotifier();
});
