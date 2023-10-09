import 'package:one_minutes_memo/util/exception/auth/auth_exception.dart';

enum FirebaseAuthSigninErrorCode {
  emailAlreadyInUse(
    receiveCode: 'email-already-in-use',
    japaneseMessage: 'このメールアドレスは既に使用されています',
  ),
  wrongPassword(
    receiveCode: 'wrong-password',
    japaneseMessage: 'パスワードが間違っています',
  ),
  userNotFound(
    receiveCode: 'user-not-found',
    japaneseMessage: 'ユーザーが見つかりません',
  ),
  userDisabled(
    receiveCode: 'user-disabled',
    japaneseMessage: 'ユーザーが無効です',
  ),
  tooManyRequests(
    receiveCode: 'too-many-requests',
    japaneseMessage: 'リクエストが多すぎます',
  ),
  invalidEmail(
    receiveCode: 'invalid-email',
    japaneseMessage: 'メールアドレス形式が無効です\n入力内容を確認してください',
  ),
  ;

  final String receiveCode;
  final String japaneseMessage;

  const FirebaseAuthSigninErrorCode(
      {required this.receiveCode, required this.japaneseMessage});

  AuthException get exception => AuthException(japaneseMessage);
}
