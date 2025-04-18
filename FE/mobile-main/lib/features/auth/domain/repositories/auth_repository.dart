import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, Login>> login(LoginParams params);

  Future<Either<Failure, Register>> register(RegisterParams params);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, DeviceResponse>> device(int id);

  Future<Either<Failure, DeviceResponse>> controlDevice(DeviceControlRequest request);

  Future<void> registerDevice(RegisterDeviceRequest request);
}
