import 'package:dartz/dartz.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';
import 'package:flutter_auth_app/utils/services/hive/hive.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Data Source
  final AuthRemoteDatasource authRemoteDatasource;
  final MainBoxMixin mainBoxMixin;

  const AuthRepositoryImpl(this.authRemoteDatasource, this.mainBoxMixin);

  @override
  Future<Either<Failure, Login>> login(LoginParams params) async {
    final response = await authRemoteDatasource.login(params);

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) {
        mainBoxMixin.addData(MainBoxKeys.isLogin, true);
        mainBoxMixin.addData(
          MainBoxKeys.authToken,
          "${loginResponse.token}",
        );
        mainBoxMixin.addData(
          MainBoxKeys.account,
          "${loginResponse.account}",
        );


        return Right(loginResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, Register>> register(RegisterParams params) async {
    final response = await authRemoteDatasource.register(params);

    return response.fold(
      (failure) => Left(failure),
      (registerResponse) {
        return Right(registerResponse.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, void>> logout() async {
    final response = await authRemoteDatasource.logout();

    return response.fold(
      (failure) => Left(failure),
      (loginResponse) => Right(loginResponse),
    );
  }

  @override
  Future<Either<Failure, DeviceResponse>> device(int id) async{
    final response = await authRemoteDatasource.getDevice(id);

    return response.fold(
      (failure) => Left(failure),
      (deviceResponse) => Right(deviceResponse),
    );
  }

  @override
  Future<Either<Failure, DeviceResponse>> controlDevice(DeviceControlRequest request) async {
    final response = await authRemoteDatasource.controlDevice(request);

    return response.fold(
      (failure) => Left(failure),
      (deviceResponse) => Right(deviceResponse),
    );
  }

  @override
  Future<Either<Failure, RegisterDeviceRequest>> registerDevice(RegisterDeviceRequest request) async {
    final response = await authRemoteDatasource.registerDevice(request);

    return response.fold(
      (failure) => Left(failure),
      (registerDeviceResponse) => Right(registerDeviceResponse),
    );
  }
}
