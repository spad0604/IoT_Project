// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_controller_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceControlRequest _$DeviceControlRequestFromJson(Map<String, dynamic> json) {
  return _DeviceControlRequest.fromJson(json);
}

/// @nodoc
mixin _$DeviceControlRequest {
  @JsonKey(name: "deviceId")
  int? get deviceId => throw _privateConstructorUsedError;
  @JsonKey(name: "account")
  String? get account => throw _privateConstructorUsedError;
  @JsonKey(name: "led1")
  int? get led1 => throw _privateConstructorUsedError;
  @JsonKey(name: "led2")
  int? get led2 => throw _privateConstructorUsedError;
  @JsonKey(name: "temperature")
  int? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: "humidity")
  int? get humidity => throw _privateConstructorUsedError;

  /// Serializes this DeviceControlRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceControlRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceControlRequestCopyWith<DeviceControlRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceControlRequestCopyWith<$Res> {
  factory $DeviceControlRequestCopyWith(DeviceControlRequest value,
          $Res Function(DeviceControlRequest) then) =
      _$DeviceControlRequestCopyWithImpl<$Res, DeviceControlRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "deviceId") int? deviceId,
      @JsonKey(name: "account") String? account,
      @JsonKey(name: "led1") int? led1,
      @JsonKey(name: "led2") int? led2,
      @JsonKey(name: "temperature") int? temperature,
      @JsonKey(name: "humidity") int? humidity});
}

/// @nodoc
class _$DeviceControlRequestCopyWithImpl<$Res,
        $Val extends DeviceControlRequest>
    implements $DeviceControlRequestCopyWith<$Res> {
  _$DeviceControlRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceControlRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? account = freezed,
    Object? led1 = freezed,
    Object? led2 = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      led1: freezed == led1
          ? _value.led1
          : led1 // ignore: cast_nullable_to_non_nullable
              as int?,
      led2: freezed == led2
          ? _value.led2
          : led2 // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceControlRequestImplCopyWith<$Res>
    implements $DeviceControlRequestCopyWith<$Res> {
  factory _$$DeviceControlRequestImplCopyWith(_$DeviceControlRequestImpl value,
          $Res Function(_$DeviceControlRequestImpl) then) =
      __$$DeviceControlRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "deviceId") int? deviceId,
      @JsonKey(name: "account") String? account,
      @JsonKey(name: "led1") int? led1,
      @JsonKey(name: "led2") int? led2,
      @JsonKey(name: "temperature") int? temperature,
      @JsonKey(name: "humidity") int? humidity});
}

/// @nodoc
class __$$DeviceControlRequestImplCopyWithImpl<$Res>
    extends _$DeviceControlRequestCopyWithImpl<$Res, _$DeviceControlRequestImpl>
    implements _$$DeviceControlRequestImplCopyWith<$Res> {
  __$$DeviceControlRequestImplCopyWithImpl(_$DeviceControlRequestImpl _value,
      $Res Function(_$DeviceControlRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceControlRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceId = freezed,
    Object? account = freezed,
    Object? led1 = freezed,
    Object? led2 = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_$DeviceControlRequestImpl(
      deviceId: freezed == deviceId
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as int?,
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      led1: freezed == led1
          ? _value.led1
          : led1 // ignore: cast_nullable_to_non_nullable
              as int?,
      led2: freezed == led2
          ? _value.led2
          : led2 // ignore: cast_nullable_to_non_nullable
              as int?,
      temperature: freezed == temperature
          ? _value.temperature
          : temperature // ignore: cast_nullable_to_non_nullable
              as int?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceControlRequestImpl implements _DeviceControlRequest {
  const _$DeviceControlRequestImpl(
      {@JsonKey(name: "deviceId") this.deviceId,
      @JsonKey(name: "account") this.account,
      @JsonKey(name: "led1") this.led1,
      @JsonKey(name: "led2") this.led2,
      @JsonKey(name: "temperature") this.temperature,
      @JsonKey(name: "humidity") this.humidity});

  factory _$DeviceControlRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceControlRequestImplFromJson(json);

  @override
  @JsonKey(name: "deviceId")
  final int? deviceId;
  @override
  @JsonKey(name: "account")
  final String? account;
  @override
  @JsonKey(name: "led1")
  final int? led1;
  @override
  @JsonKey(name: "led2")
  final int? led2;
  @override
  @JsonKey(name: "temperature")
  final int? temperature;
  @override
  @JsonKey(name: "humidity")
  final int? humidity;

  @override
  String toString() {
    return 'DeviceControlRequest(deviceId: $deviceId, account: $account, led1: $led1, led2: $led2, temperature: $temperature, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceControlRequestImpl &&
            (identical(other.deviceId, deviceId) ||
                other.deviceId == deviceId) &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.led1, led1) || other.led1 == led1) &&
            (identical(other.led2, led2) || other.led2 == led2) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, deviceId, account, led1, led2, temperature, humidity);

  /// Create a copy of DeviceControlRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceControlRequestImplCopyWith<_$DeviceControlRequestImpl>
      get copyWith =>
          __$$DeviceControlRequestImplCopyWithImpl<_$DeviceControlRequestImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceControlRequestImplToJson(
      this,
    );
  }
}

abstract class _DeviceControlRequest implements DeviceControlRequest {
  const factory _DeviceControlRequest(
          {@JsonKey(name: "deviceId") final int? deviceId,
          @JsonKey(name: "account") final String? account,
          @JsonKey(name: "led1") final int? led1,
          @JsonKey(name: "led2") final int? led2,
          @JsonKey(name: "temperature") final int? temperature,
          @JsonKey(name: "humidity") final int? humidity}) =
      _$DeviceControlRequestImpl;

  factory _DeviceControlRequest.fromJson(Map<String, dynamic> json) =
      _$DeviceControlRequestImpl.fromJson;

  @override
  @JsonKey(name: "deviceId")
  int? get deviceId;
  @override
  @JsonKey(name: "account")
  String? get account;
  @override
  @JsonKey(name: "led1")
  int? get led1;
  @override
  @JsonKey(name: "led2")
  int? get led2;
  @override
  @JsonKey(name: "temperature")
  int? get temperature;
  @override
  @JsonKey(name: "humidity")
  int? get humidity;

  /// Create a copy of DeviceControlRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceControlRequestImplCopyWith<_$DeviceControlRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
