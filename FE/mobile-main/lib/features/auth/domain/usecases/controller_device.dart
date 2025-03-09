import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:flutter_auth_app/core/usecase/usecase.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/auth/domain/repositories/auth_repository.dart';

class ControllerDevice extends UseCase<DeviceResponse, DeviceControlRequest> {
  final AuthRepository _authRepository;

  ControllerDevice(this._authRepository);
  
  @override
  Future<Either<Failure, DeviceResponse>> call(DeviceControlRequest params) {
    return _authRepository.controlDevice(params);
  }
}
