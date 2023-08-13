// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      memoId: json['memoId'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
      timeStamp: DateTime.parse(json['timeStamp'] as String),
      image: json['image'] as String?,
      shared: json['shared'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'memoId': instance.memoId,
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'timeStamp': instance.timeStamp.toIso8601String(),
      'image': instance.image,
      'shared': instance.shared,
    };
