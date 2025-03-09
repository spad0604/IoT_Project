// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'res_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Res<T> _$ResFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _Res<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$Res<T> {
  @JsonKey(name: "code")
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: "message")
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: "data")
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this Res to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of Res
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResCopyWith<T, Res<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResCopyWith<T, $Res> {
  factory $ResCopyWith(Res<T> value, $Res Function(Res<T>) then) =
      _$ResCopyWithImpl<T, $Res, Res<T>>;
  @useResult
  $Res call(
      {@JsonKey(name: "code") int code,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") T? data});
}

/// @nodoc
class _$ResCopyWithImpl<T, $Res, $Val extends Res<T>>
    implements $ResCopyWith<T, $Res> {
  _$ResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Res
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResImplCopyWith<T, $Res> implements $ResCopyWith<T, $Res> {
  factory _$$ResImplCopyWith(
          _$ResImpl<T> value, $Res Function(_$ResImpl<T>) then) =
      __$$ResImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "code") int code,
      @JsonKey(name: "message") String message,
      @JsonKey(name: "data") T? data});
}

/// @nodoc
class __$$ResImplCopyWithImpl<T, $Res>
    extends _$ResCopyWithImpl<T, $Res, _$ResImpl<T>>
    implements _$$ResImplCopyWith<T, $Res> {
  __$$ResImplCopyWithImpl(
      _$ResImpl<T> _value, $Res Function(_$ResImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of Res
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$ResImpl<T>(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ResImpl<T> implements _Res<T> {
  const _$ResImpl(
      {@JsonKey(name: "code") required this.code,
      @JsonKey(name: "message") required this.message,
      @JsonKey(name: "data") this.data});

  factory _$ResImpl.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$ResImplFromJson(json, fromJsonT);

  @override
  @JsonKey(name: "code")
  final int code;
  @override
  @JsonKey(name: "message")
  final String message;
  @override
  @JsonKey(name: "data")
  final T? data;

  @override
  String toString() {
    return 'Res<$T>(code: $code, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResImpl<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, code, message, const DeepCollectionEquality().hash(data));

  /// Create a copy of Res
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResImplCopyWith<T, _$ResImpl<T>> get copyWith =>
      __$$ResImplCopyWithImpl<T, _$ResImpl<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ResImplToJson<T>(this, toJsonT);
  }
}

abstract class _Res<T> implements Res<T> {
  const factory _Res(
      {@JsonKey(name: "code") required final int code,
      @JsonKey(name: "message") required final String message,
      @JsonKey(name: "data") final T? data}) = _$ResImpl<T>;

  factory _Res.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$ResImpl<T>.fromJson;

  @override
  @JsonKey(name: "code")
  int get code;
  @override
  @JsonKey(name: "message")
  String get message;
  @override
  @JsonKey(name: "data")
  T? get data;

  /// Create a copy of Res
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResImplCopyWith<T, _$ResImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
