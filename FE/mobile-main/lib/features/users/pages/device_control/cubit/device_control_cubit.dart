import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_control_state.dart';
part 'device_control_cubit.freezed.dart';

class DeviceControlCubit extends Cubit<DeviceControlState> {
  DeviceControlCubit() : super(const DeviceControlState.initial());
}
