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
// required String memoId,
// required String userId,
  String get title => throw _privateConstructorUsedError;
  List<String?> get contents => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
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
      {String title,
      List<String?> contents,
      @TimestampConverter() DateTime? createdAt,
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
    Object? title = null,
    Object? contents = null,
    Object? createdAt = freezed,
    Object? image = freezed,
    Object? shared = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {String title,
      List<String?> contents,
      @TimestampConverter() DateTime? createdAt,
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
    Object? title = null,
    Object? contents = null,
    Object? createdAt = freezed,
    Object? image = freezed,
    Object? shared = null,
  }) {
    return _then(_$_Memo(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<String?>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {required this.title,
      required final List<String?> contents,
      @TimestampConverter() this.createdAt,
      this.image,
      this.shared = false})
      : _contents = contents;

  factory _$_Memo.fromJson(Map<String, dynamic> json) => _$$_MemoFromJson(json);

// required String memoId,
// required String userId,
  @override
  final String title;
  final List<String?> _contents;
  @override
  List<String?> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final String? image;
  @override
  @JsonKey()
  final bool shared;

  @override
  String toString() {
    return 'Memo(title: $title, contents: $contents, createdAt: $createdAt, image: $image, shared: $shared)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Memo &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.shared, shared) || other.shared == shared));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title,
      const DeepCollectionEquality().hash(_contents), createdAt, image, shared);

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
      {required final String title,
      required final List<String?> contents,
      @TimestampConverter() final DateTime? createdAt,
      final String? image,
      final bool shared}) = _$_Memo;

  factory _Memo.fromJson(Map<String, dynamic> json) = _$_Memo.fromJson;

  @override // required String memoId,
// required String userId,
  String get title;
  @override
  List<String?> get contents;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  String? get image;
  @override
  bool get shared;
  @override
  @JsonKey(ignore: true)
  _$$_MemoCopyWith<_$_Memo> get copyWith => throw _privateConstructorUsedError;
}
