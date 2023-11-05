import 'dart:async';

import 'package:one_minutes_memo/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_anonymously_provider.g.dart';

@riverpod
class SignInAnonymouslyNotifier extends _$SignInAnonymouslyNotifier {
  @override
  FutureOr<void> build() {}

  Future<void> signInAnonymously() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signInAnonymously());
  }
}
