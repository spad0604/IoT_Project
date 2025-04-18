import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/error/failure.dart';
import 'package:flutter_auth_app/core/usecase/usecase.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';
import 'package:flutter_auth_app/features/auth/domain/repositories/auth_repository.dart';

class RegisterDeviceUC extends UseCase<void, RegisterDeviceRequest> {
  final AuthRepository _repo;

  RegisterDeviceUC(this._repo);

  @override
  Future<Either<Failure, void>> call(RegisterDeviceRequest params) async {
    try {
      await _repo.registerDevice(params);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
