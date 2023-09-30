import 'package:one_minutes_memo/feature/auth/businesslogic/auth_logic.dart';
import 'package:one_minutes_memo/feature/auth/repository/auth_repository_impl.dart';

class AuthController {
  AuthController();

  // ここはImplを入れてもいいんだろうか？
  final AuthLogic authLogic = AuthLogic(AuthRepositoryImpl());

  @override
  Future<void> signUp(
      {required String email,
      required String password,
      String? userName}) async {
    await authLogic.signUp(
        email: email, password: password, userName: userName);
  }

  @override
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await authLogic.signIn(email: email, password: password);
  }
}
