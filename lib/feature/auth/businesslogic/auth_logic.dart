import 'package:one_minutes_memo/core/exception/auth_exception.dart';
import 'package:one_minutes_memo/feature/auth/businesslogic/interface/auth_repository_interface.dart';
import 'package:one_minutes_memo/model/local_user.dart';

class AuthLogic {
  AuthLogic(this.repository);

  final AuthRepositoryInterface repository;

  Future<void> signUp(
      {required String email,
      required String password,
      String? userName}) async {
    try {
      // userNameはNullの時にIDにしたい
      final user =
          LocalUser(password: password, email: email, userName: userName ?? '');
      await repository.signUp(user);
    } catch (e) {
      throw AuthException(e.toString());
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final user = LocalUser(password: password, email: email);
    await repository.signIn(user);
  }
}
