import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_controller_request.freezed.dart';
part 'device_controller_request.g.dart';

@freezed
class DeviceControlRequest with _$DeviceControlRequest {
    const factory DeviceControlRequest({
        @JsonKey(name: "deviceId")
        int? deviceId,
        @JsonKey(name: "account")
        String? account,
        @JsonKey(name: "led1")
        int? led1,
        @JsonKey(name: "led2")
        int? led2,
        @JsonKey(name: "temperature")
        int? temperature,
        @JsonKey(name: "humidity")
        int? humidity,
    }) = _DeviceControlRequest;

    factory DeviceControlRequest.fromJson(Map<String, dynamic> json) => _$DeviceControlRequestFromJson(json);
}
