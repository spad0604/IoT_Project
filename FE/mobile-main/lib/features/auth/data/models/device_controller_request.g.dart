// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_controller_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceControlRequestImpl _$$DeviceControlRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$DeviceControlRequestImpl(
      deviceId: (json['deviceId'] as num?)?.toInt(),
      account: json['account'] as String?,
      led1: (json['led1'] as num?)?.toInt(),
      led2: (json['led2'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toInt(),
      humidity: (json['humidity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DeviceControlRequestImplToJson(
        _$DeviceControlRequestImpl instance) =>
    <String, dynamic>{
      'deviceId': instance.deviceId,
      'account': instance.account,
      'led1': instance.led1,
      'led2': instance.led2,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };
