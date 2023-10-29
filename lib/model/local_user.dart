import 'package:freezed_annotation/freezed_annotation.dart';

part 'local_user.freezed.dart';
part 'local_user.g.dart';

@freezed
class LocalUser with _$LocalUser {
  const factory LocalUser({
    required String password,
    required String email,
    String? userName,
  }) = _LocalUser;

  factory LocalUser.fromJson(Map<String, dynamic> json) =>
      _$LocalUserFromJson(json);
}
