import 'package:freezed_annotation/freezed_annotation.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  const factory Memo({
    required String memoId,
    required String userId,
    required String title,
    required List<String> content,
    // TODO: DateTime ⇔ Timestampの変換
    required DateTime timeStamp,
    String? image,
    @Default(false) bool shared,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
