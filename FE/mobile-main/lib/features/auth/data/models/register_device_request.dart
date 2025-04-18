import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_device_request.freezed.dart';
part 'register_device_request.g.dart';

@freezed
class RegisterDeviceRequest with _$RegisterDeviceRequest {
  const factory RegisterDeviceRequest({
    @Default("") String fcmToken,
    @Default("") String deviceId, 
    @Default("") String account,
  }) = _RegisterDeviceRequest;

  factory RegisterDeviceRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterDeviceRequestFromJson(json);
}
