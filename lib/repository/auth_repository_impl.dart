import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/model/local_user.dart';
import 'package:one_minutes_memo/repository/auth_repository_interface.dart';
import 'package:one_minutes_memo/util/exception/auth/auth_exception.dart';
import 'package:one_minutes_memo/util/exception/auth/firebase_auth_signin_error_code.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  AuthRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Future<void> signUp(LocalUser user) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthSigninErrorCode.emailAlreadyInUse.receiveCode) {
        throw FirebaseAuthSigninErrorCode.emailAlreadyInUse.exception;
      }
      throw const AuthException('ユーザー登録に失敗しました');
    } catch (e) {
      throw const AuthException('原因不明のエラーが発生しました\n開発者にお問い合わせください');
    }
  }

  @override
  Future<void> signIn(LocalUser user) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseAuthSigninErrorCode.userNotFound.receiveCode) {
        throw FirebaseAuthSigninErrorCode.userNotFound.exception;
      } else if (e.code ==
          FirebaseAuthSigninErrorCode.wrongPassword.receiveCode) {
        throw FirebaseAuthSigninErrorCode.wrongPassword.exception;
      } else if (e.code ==
          FirebaseAuthSigninErrorCode.invalidEmail.receiveCode) {
        throw FirebaseAuthSigninErrorCode.invalidEmail.exception;
      } else if (e.code ==
          FirebaseAuthSigninErrorCode.userDisabled.receiveCode) {
        throw FirebaseAuthSigninErrorCode.userDisabled.exception;
      } else if (e.code ==
          FirebaseAuthSigninErrorCode.tooManyRequests.receiveCode) {
        throw FirebaseAuthSigninErrorCode.tooManyRequests.exception;
      }
      throw const AuthException('ログインに失敗しました');
    } catch (e) {
      throw const AuthException('原因不明のエラーが発生しました\n開発者にお問い合わせください');
    }
  }

  @override
  Future<void> signInAnonymously() async {
    try {
      await _auth.signInAnonymously();
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          const AuthException('匿名認証が有効になっていません\n開発者にお問い合わせください');
          break;
        default:
          throw const AuthException('原因不明のエラーが発生しました\n開発者にお問い合わせください');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> deleteUser(LocalUser user) async {
    // await user?.delete();
  }
}

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

final authRepositoryProvider = Provider.autoDispose<AuthRepositoryInterface>(
    (ref) => AuthRepositoryImpl(ref.watch(firebaseAuthProvider)));

final authStateChangesProvier = StreamProvider.autoDispose<User?>(
    (ref) => ref.watch(authRepositoryProvider).authStateChanges());
