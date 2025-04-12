// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_device_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterDeviceRequestImpl _$$RegisterDeviceRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterDeviceRequestImpl(
      fcmToken: json['fcmToken'] as String?,
      deviceId: json['deviceId'] as String?,
      account: json['account'] as String?,
    );

Map<String, dynamic> _$$RegisterDeviceRequestImplToJson(
        _$RegisterDeviceRequestImpl instance) =>
    <String, dynamic>{
      'fcmToken': instance.fcmToken,
      'deviceId': instance.deviceId,
      'account': instance.account,
    };
