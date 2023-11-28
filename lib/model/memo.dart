import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:one_minutes_memo/model/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'memo.freezed.dart';
part 'memo.g.dart';

@freezed
class Memo with _$Memo {
  const factory Memo({
    // required String memoId,
    // required String userId,
    required String title,
    required List<String?> contents,
    @TimestampConverter() DateTime? createdAt,
    String? image,
    @Default(false) bool shared,
  }) = _Memo;

  factory Memo.fromJson(Map<String, dynamic> json) => _$MemoFromJson(json);
}
