import 'package:one_minutes_memo/businesslogic/interface/auth_repository_interface.dart';
import 'package:one_minutes_memo/model/local_user.dart';

class AuthLogic {
  AuthLogic(this.repository);

  final AuthRepositoryInterface repository;

  Future<void> signUp(
      {required String email,
      required String password,
      String? userName}) async {
    // userNameはNullの時にIDにしたい
    final user =
        LocalUser(password: password, email: email, userName: userName ?? '');
    await repository.signUp(user);
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final user = LocalUser(password: password, email: email);
    await repository.signIn(user);
  }
}
