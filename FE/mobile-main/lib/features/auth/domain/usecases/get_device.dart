import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:flutter_auth_app/core/usecase/usecase.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';

class GetDevice extends UseCase<DeviceResponse, int> {
  final AuthRepository _authRepository;

  GetDevice(this._authRepository);
  @override
  Future<Either<Failure, DeviceResponse>> call(int params) {
    return _authRepository.device(params);
  }
}
