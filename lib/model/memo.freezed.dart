// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'memo.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Memo _$MemoFromJson(Map<String, dynamic> json) {
  return _Memo.fromJson(json);
}

/// @nodoc
mixin _$Memo {
  String get memoId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get content =>
      throw _privateConstructorUsedError; // TODO: DateTime ⇔ Timestampの変換
  DateTime get timeStamp => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool get shared => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MemoCopyWith<Memo> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemoCopyWith<$Res> {
  factory $MemoCopyWith(Memo value, $Res Function(Memo) then) =
      _$MemoCopyWithImpl<$Res, Memo>;
  @useResult
  $Res call(
      {String memoId,
      String userId,
      String title,
      List<String> content,
      DateTime timeStamp,
      String? image,
      bool shared});
}

/// @nodoc
class _$MemoCopyWithImpl<$Res, $Val extends Memo>
    implements $MemoCopyWith<$Res> {
  _$MemoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoId = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
    Object? timeStamp = null,
    Object? image = freezed,
    Object? shared = null,
  }) {
    return _then(_value.copyWith(
      memoId: null == memoId
          ? _value.memoId
          : memoId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      shared: null == shared
          ? _value.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MemoCopyWith<$Res> implements $MemoCopyWith<$Res> {
  factory _$$_MemoCopyWith(_$_Memo value, $Res Function(_$_Memo) then) =
      __$$_MemoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String memoId,
      String userId,
      String title,
      List<String> content,
      DateTime timeStamp,
      String? image,
      bool shared});
}

/// @nodoc
class __$$_MemoCopyWithImpl<$Res> extends _$MemoCopyWithImpl<$Res, _$_Memo>
    implements _$$_MemoCopyWith<$Res> {
  __$$_MemoCopyWithImpl(_$_Memo _value, $Res Function(_$_Memo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memoId = null,
    Object? userId = null,
    Object? title = null,
    Object? content = null,
    Object? timeStamp = null,
    Object? image = freezed,
    Object? shared = null,
  }) {
    return _then(_$_Memo(
      memoId: null == memoId
          ? _value.memoId
          : memoId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      timeStamp: null == timeStamp
          ? _value.timeStamp
          : timeStamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      shared: null == shared
          ? _value.shared
          : shared // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Memo implements _Memo {
  const _$_Memo(
      {required this.memoId,
      required this.userId,
      required this.title,
      required final List<String> content,
      required this.timeStamp,
      this.image,
      this.shared = false})
      : _content = content;

  factory _$_Memo.fromJson(Map<String, dynamic> json) => _$$_MemoFromJson(json);

  @override
  final String memoId;
  @override
  final String userId;
  @override
  final String title;
  final List<String> _content;
  @override
  List<String> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

// TODO: DateTime ⇔ Timestampの変換
  @override
  final DateTime timeStamp;
  @override
  final String? image;
  @override
  @JsonKey()
  final bool shared;

  @override
  String toString() {
    return 'Memo(memoId: $memoId, userId: $userId, title: $title, content: $content, timeStamp: $timeStamp, image: $image, shared: $shared)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Memo &&
            (identical(other.memoId, memoId) || other.memoId == memoId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.timeStamp, timeStamp) ||
                other.timeStamp == timeStamp) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.shared, shared) || other.shared == shared));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, memoId, userId, title,
      const DeepCollectionEquality().hash(_content), timeStamp, image, shared);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MemoCopyWith<_$_Memo> get copyWith =>
      __$$_MemoCopyWithImpl<_$_Memo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MemoToJson(
      this,
    );
  }
}

abstract class _Memo implements Memo {
  const factory _Memo(
      {required final String memoId,
      required final String userId,
      required final String title,
      required final List<String> content,
      required final DateTime timeStamp,
      final String? image,
      final bool shared}) = _$_Memo;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$_Memo.fromJson;

  @override
  String get memoId;
  @override
  String get userId;
  @override
  String get title;
  @override
  List<String> get content;
  @override // TODO: DateTime ⇔ Timestampの変換
  DateTime get timeStamp;
  @override
  String? get image;
  @override
  bool get shared;
  @override
  @JsonKey(ignore: true)
  _$$_MemoCopyWith<_$_Memo> get copyWith => throw _privateConstructorUsedError;
}
