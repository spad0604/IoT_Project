part of 'device_control_cubit.dart';

@freezed
class DeviceControlState with _$DeviceControlState {
  const factory DeviceControlState.initial() = Initial;
  const factory DeviceControlState.loading() = Loading;
  const factory DeviceControlState.failure(String message) = _Failure;
  const factory DeviceControlState.success(DeviceResponse device) = Success;
}
