import 'package:one_minutes_memo/model/local_user.dart';

abstract class AuthRepositoryInterface {
  Future<void> signIn(LocalUser user);

  Future<void> signUp(LocalUser user);

  Future<void> signOut();

  Future<void> deleteUser(LocalUser user);

  // Future<User>
}
