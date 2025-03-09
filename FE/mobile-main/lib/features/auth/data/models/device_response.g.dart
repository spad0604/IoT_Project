// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DeviceResponseImpl _$$DeviceResponseImplFromJson(Map<String, dynamic> json) =>
    _$DeviceResponseImpl(
      id: (json['id'] as num?)?.toInt(),
      led1: (json['led1'] as num?)?.toInt(),
      led2: (json['led2'] as num?)?.toInt(),
      temperature: (json['temperature'] as num?)?.toDouble(),
      humidity: (json['humidity'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$DeviceResponseImplToJson(
        _$DeviceResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'led1': instance.led1,
      'led2': instance.led2,
      'temperature': instance.temperature,
      'humidity': instance.humidity,
    };
