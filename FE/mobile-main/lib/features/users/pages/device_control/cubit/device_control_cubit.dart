// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:flutter_auth_app/core/api/web_socket_manager.dart';
import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:flutter_auth_app/core/websocket/websocket_manager.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/controller_device.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/get_device.dart';
import 'package:flutter_auth_app/utils/services/hive/main_box.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_control_state.dart';
part 'device_control_cubit.freezed.dart';

class DeviceControlCubit extends Cubit<DeviceControlState> {
  DeviceControlCubit(this._getDevice, this._controllerDevice)
      : super(const Initial()) {
    _initWebSocket();
  }

  final GetDevice _getDevice;
  final ControllerDevice _controllerDevice;

  void _initWebSocket() {
    final webSocket = sl<WebSocketConfig>();
    webSocket.onDeviceDataReceived = (DeviceResponse device) {
      emit(Success(device));
    };

    webSocket.connectWebSocket();
  }

  Future<void> getDevice() async {
    emit(const Loading());

    // Không gọi API nữa, dữ liệu sẽ đến từ WebSocket
    // Gửi loading rồi đợi WebSocket emit
  }

  Future<void> controlDevice(DeviceControlRequest request) async {
    emit(const Loading());

    final result = await _controllerDevice.call(request);
    emit(result.fold(
            (failure) => _Failure(failure.toString()), (device) => Success(device)));
  }
}
