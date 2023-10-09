import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/feature/auth/domain/interface/auth_repository_interface.dart';
import 'package:one_minutes_memo/feature/auth/domain/local_user.dart';

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
      rethrow;
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
      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
      rethrow;
    } catch (e) {
      rethrow;
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
