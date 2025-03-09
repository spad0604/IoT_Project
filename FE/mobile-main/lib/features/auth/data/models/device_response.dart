import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_response.freezed.dart';
part 'device_response.g.dart';

@freezed
class DeviceResponse with _$DeviceResponse {
  const factory DeviceResponse({
    @JsonKey(name: "id") int? id,
    @JsonKey(name: "led1") int? led1,
    @JsonKey(name: "led2") int? led2,
    @JsonKey(name: "temperature") double? temperature,
    @JsonKey(name: "humidity") double? humidity,
  }) = _DeviceResponse;

  factory DeviceResponse.fromJson(Map<String, dynamic> json) =>
      _$DeviceResponseFromJson(json);
}
