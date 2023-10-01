import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:one_minutes_memo/feature/auth/domain/interface/auth_repository_interface.dart';
import 'package:one_minutes_memo/feature/auth/domain/local_user.dart';

class AuthRepositoryImpl implements AuthRepositoryInterface {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> signUp(LocalUser user) async {
    await auth.createUserWithEmailAndPassword(
      email: user.email,
      password: user.password,
    );
  }

  @override
  Future<void> signIn(LocalUser user) async {
    try {
      await auth.signInWithEmailAndPassword(
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
    }
  }

  @override
  Future<void> signOut() async {
    await auth.signOut();
  }

  @override
  Future<void> deleteUser(LocalUser user) async {
    // await user?.delete();
  }
}

final authRepositoryProvider = Provider.autoDispose<AuthRepositoryInterface>(
    (ref) => AuthRepositoryImpl());
