import 'dart:async';

import 'package:one_minutes_memo/model/local_user.dart';
import 'package:one_minutes_memo/repository/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

@riverpod
class SignInAsyncNotifier extends _$SignInAsyncNotifier {
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
