import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_request.freezed.dart';
part 'register_device_request.g.dart';

@freezed
class RegisterDeviceRequest with _$RegisterDeviceRequest {
  const factory RegisterDeviceRequest({
    @JsonKey(name: "fcmToken") String? fcmToken,
    @JsonKey(name: "deviceId") String? deviceId,
    @JsonKey(name: "account") String? account,
  }) = _RegisterDeviceRequest;

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);
}
