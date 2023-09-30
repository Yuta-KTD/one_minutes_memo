abstract class AuthController {
  Future<void> signUp(
      {required String email, required String password, String? userName});

  Future<void> signIn({
    required String email,
    required String password,
  });
}
