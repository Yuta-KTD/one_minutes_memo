import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/repository/auth_repository_impl.dart';

class SignInAnonymouslyNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signInAnonymously());
  }
}

final signInAnonymousAsyncProvider =
    AsyncNotifierProvider.autoDispose<SignInAnonymouslyNotifier, void>(() {
  return SignInAnonymouslyNotifier();
});
