// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_device_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RegisterDeviceRequest _$RegisterDeviceRequestFromJson(
    Map<String, dynamic> json) {
  return _RegisterDeviceRequest.fromJson(json);
}

/// @nodoc
mixin _$RegisterDeviceRequest {
  @JsonKey(name: "fcmToken")
  String? get fcmToken => throw _privateConstructorUsedError;
  @JsonKey(name: "deviceId")
  String? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: "account")
  String? get account => throw _privateConstructorUsedError;

  /// Serializes this RegisterDeviceRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RegisterDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RegisterDeviceRequestCopyWith<RegisterDeviceRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterDeviceRequestCopyWith<$Res> {
  factory $RegisterDeviceRequestCopyWith(RegisterDeviceRequest value,
          $Res Function(RegisterDeviceRequest) then) =
      _$RegisterDeviceRequestCopyWithImpl<$Res, RegisterDeviceRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "fcmToken") String? fcmToken,
      @JsonKey(name: "deviceId") String? deviceId,
      @JsonKey(name: "account") String? account});
}

/// @nodoc
class _$RegisterDeviceRequestCopyWithImpl<$Res,
        $Val extends RegisterDeviceRequest>
    implements $RegisterDeviceRequestCopyWith<$Res> {
  _$RegisterDeviceRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RegisterDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
    Object? deviceId = freezed,
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterDeviceRequestImplCopyWith<$Res>
    implements $RegisterDeviceRequestCopyWith<$Res> {
  factory _$$RegisterDeviceRequestImplCopyWith(
          _$RegisterDeviceRequestImpl value,
          $Res Function(_$RegisterDeviceRequestImpl) then) =
      __$$RegisterDeviceRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "fcmToken") String? fcmToken,
      @JsonKey(name: "deviceId") String? deviceId,
      @JsonKey(name: "account") String? account});
}

/// @nodoc
class __$$RegisterDeviceRequestImplCopyWithImpl<$Res>
    extends _$RegisterDeviceRequestCopyWithImpl<$Res,
        _$RegisterDeviceRequestImpl>
    implements _$$RegisterDeviceRequestImplCopyWith<$Res> {
  __$$RegisterDeviceRequestImplCopyWithImpl(_$RegisterDeviceRequestImpl _value,
      $Res Function(_$RegisterDeviceRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of RegisterDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fcmToken = freezed,
    Object? deviceId = freezed,
    Object? account = freezed,
  }) {
    return _then(_$RegisterDeviceRequestImpl(
      fcmToken: freezed == fcmToken
          ? _value.fcmToken
          : fcmToken // ignore: cast_nullable_to_non_nullable
              as String?,
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RegisterDeviceRequestImpl implements _RegisterDeviceRequest {
  const _$RegisterDeviceRequestImpl(
      {@JsonKey(name: "fcmToken") this.fcmToken,
      @JsonKey(name: "deviceId") this.deviceId,
      @JsonKey(name: "account") this.account});

  factory _$RegisterDeviceRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$RegisterDeviceRequestImplFromJson(json);

  @override
  @JsonKey(name: "fcmToken")
  final String? fcmToken;
  @override
  @JsonKey(name: "deviceId")
  final String? deviceId;
  @override
  @JsonKey(name: "account")
  final String? account;

  @override
  String toString() {
    return 'RegisterDeviceRequest(fcmToken: $fcmToken, deviceId: $deviceId, account: $account)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterDeviceRequestImpl &&
            (identical(other.fcmToken, fcmToken) ||
                other.fcmToken == fcmToken) &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.account, account) || other.account == account));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, fcmToken, deviceId, account);

  /// Create a copy of RegisterDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterDeviceRequestImplCopyWith<_$RegisterDeviceRequestImpl>
      get copyWith => __$$RegisterDeviceRequestImplCopyWithImpl<
          _$RegisterDeviceRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RegisterDeviceRequestImplToJson(
      this,
    );
  }
}

abstract class _RegisterDeviceRequest implements RegisterDeviceRequest {
  const factory _RegisterDeviceRequest(
          {@JsonKey(name: "fcmToken") final String? fcmToken,
          @JsonKey(name: "deviceId") final String? deviceId,
          @JsonKey(name: "account") final String? account}) =
      _$RegisterDeviceRequestImpl;

  factory _RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =
      _$RegisterDeviceRequestImpl.fromJson;

  @override
  @JsonKey(name: "fcmToken")
  String? get fcmToken;
  @override
  @JsonKey(name: "deviceId")
  String? get deviceId;
  @override
  @JsonKey(name: "account")
  String? get account;

  /// Create a copy of RegisterDeviceRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RegisterDeviceRequestImplCopyWith<_$RegisterDeviceRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
