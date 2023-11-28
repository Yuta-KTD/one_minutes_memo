// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'memo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Memo _$$_MemoFromJson(Map<String, dynamic> json) => _$_Memo(
      title: json['title'] as String,
      contents:
          (json['contents'] as List<dynamic>).map((e) => e as String?).toList(),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['createdAt'], const TimestampConverter().fromJson),
      image: json['image'] as String?,
      shared: json['shared'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MemoToJson(_$_Memo instance) => <String, dynamic>{
      'title': instance.title,
      'contents': instance.contents,
      'createdAt': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'image': instance.image,
      'shared': instance.shared,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
