// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceResponse _$DeviceResponseFromJson(Map<String, dynamic> json) {
  return _DeviceResponse.fromJson(json);
}

/// @nodoc
mixin _$DeviceResponse {
  @JsonKey(name: "id")
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: "led1")
  int? get led1 => throw _privateConstructorUsedError;
  @JsonKey(name: "led2")
  int? get led2 => throw _privateConstructorUsedError;
  @JsonKey(name: "temperature")
  double? get temperature => throw _privateConstructorUsedError;
  @JsonKey(name: "humidity")
  double? get humidity => throw _privateConstructorUsedError;

  /// Serializes this DeviceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceResponseCopyWith<DeviceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceResponseCopyWith<$Res> {
  factory $DeviceResponseCopyWith(
          DeviceResponse value, $Res Function(DeviceResponse) then) =
      _$DeviceResponseCopyWithImpl<$Res, DeviceResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "led1") int? led1,
      @JsonKey(name: "led2") int? led2,
      @JsonKey(name: "temperature") double? temperature,
      @JsonKey(name: "humidity") double? humidity});
}

/// @nodoc
class _$DeviceResponseCopyWithImpl<$Res, $Val extends DeviceResponse>
    implements $DeviceResponseCopyWith<$Res> {
  _$DeviceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? led1 = freezed,
    Object? led2 = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as double?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceResponseImplCopyWith<$Res>
    implements $DeviceResponseCopyWith<$Res> {
  factory _$$DeviceResponseImplCopyWith(_$DeviceResponseImpl value,
          $Res Function(_$DeviceResponseImpl) then) =
      __$$DeviceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int? id,
      @JsonKey(name: "led1") int? led1,
      @JsonKey(name: "led2") int? led2,
      @JsonKey(name: "temperature") double? temperature,
      @JsonKey(name: "humidity") double? humidity});
}

/// @nodoc
class __$$DeviceResponseImplCopyWithImpl<$Res>
    extends _$DeviceResponseCopyWithImpl<$Res, _$DeviceResponseImpl>
    implements _$$DeviceResponseImplCopyWith<$Res> {
  __$$DeviceResponseImplCopyWithImpl(
      _$DeviceResponseImpl _value, $Res Function(_$DeviceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? led1 = freezed,
    Object? led2 = freezed,
    Object? temperature = freezed,
    Object? humidity = freezed,
  }) {
    return _then(_$DeviceResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
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
              as double?,
      humidity: freezed == humidity
          ? _value.humidity
          : humidity // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceResponseImpl implements _DeviceResponse {
  const _$DeviceResponseImpl(
      {@JsonKey(name: "id") this.id,
      @JsonKey(name: "led1") this.led1,
      @JsonKey(name: "led2") this.led2,
      @JsonKey(name: "temperature") this.temperature,
      @JsonKey(name: "humidity") this.humidity});

  factory _$DeviceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int? id;
  @override
  @JsonKey(name: "led1")
  final int? led1;
  @override
  @JsonKey(name: "led2")
  final int? led2;
  @override
  @JsonKey(name: "temperature")
  final double? temperature;
  @override
  @JsonKey(name: "humidity")
  final double? humidity;

  @override
  String toString() {
    return 'DeviceResponse(id: $id, led1: $led1, led2: $led2, temperature: $temperature, humidity: $humidity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.led1, led1) || other.led1 == led1) &&
            (identical(other.led2, led2) || other.led2 == led2) &&
            (identical(other.temperature, temperature) ||
                other.temperature == temperature) &&
            (identical(other.humidity, humidity) ||
                other.humidity == humidity));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, led1, led2, temperature, humidity);

  /// Create a copy of DeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceResponseImplCopyWith<_$DeviceResponseImpl> get copyWith =>
      __$$DeviceResponseImplCopyWithImpl<_$DeviceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceResponseImplToJson(
      this,
    );
  }
}

abstract class _DeviceResponse implements DeviceResponse {
  const factory _DeviceResponse(
          {@JsonKey(name: "id") final int? id,
          @JsonKey(name: "led1") final int? led1,
          @JsonKey(name: "led2") final int? led2,
          @JsonKey(name: "temperature") final double? temperature,
          @JsonKey(name: "humidity") final double? humidity}) =
      _$DeviceResponseImpl;

  factory _DeviceResponse.fromJson(Map<String, dynamic> json) =
      _$DeviceResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int? get id;
  @override
  @JsonKey(name: "led1")
  int? get led1;
  @override
  @JsonKey(name: "led2")
  int? get led2;
  @override
  @JsonKey(name: "temperature")
  double? get temperature;
  @override
  @JsonKey(name: "humidity")
  double? get humidity;

  /// Create a copy of DeviceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceResponseImplCopyWith<_$DeviceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
