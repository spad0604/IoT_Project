import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/res_response.dart';
import 'package:flutter_auth_app/features/features.dart';

abstract class AuthRemoteDatasource {
  Future<Either<Failure, RegisterResponse>> register(RegisterParams params);

  Future<Either<Failure, LoginResponse>> login(LoginParams params);

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, DeviceResponse>> getDevice(int id);

  Future<Either<Failure, DeviceResponse>> controlDevice(DeviceControlRequest request);

  Future<Either<Failure, RegisterDeviceRequest>> registerDevice(RegisterDeviceRequest request);
}

class AuthRemoteDatasourceImpl implements AuthRemoteDatasource {
  final DioClient _client;

  AuthRemoteDatasourceImpl(this._client);

  @override
  Future<Either<Failure, RegisterResponse>> register(
    RegisterParams params,
  ) async {
    final response = await _client.postRequest(
      ListAPI.user,
      data: params.toJson(),
      converter: (response) {
        final res = Res<Map<String, dynamic>>.fromJson(
          response as Map<String, dynamic>,
          (json) => json! as Map<String, dynamic>,
        );
        return RegisterResponse.fromJson(res.data ?? {});
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, LoginResponse>> login(LoginParams params) async {
    final response = await _client.postRequest(
      ListAPI.login,
      data: params.toJson(),
      converter: (response) {
        final res = Res<Map<String, dynamic>>.fromJson(
          response as Map<String, dynamic>,
          (json) => json! as Map<String, dynamic>,
        );
        return LoginResponse.fromJson(res.data ?? {});
      },
    );

    return response;
  }

  @override
  Future<Either<Failure, void>> logout() async {
    final response = await _client.postRequest(
      ListAPI.logout,
      converter: (response) {
        final res = Res<Map<String, dynamic>>.fromJson(
          response as Map<String, dynamic>,
          (json) => json! as Map<String, dynamic>,
        );
        return DiagnosticResponse.fromJson(res.data ?? {});
      },
    );

    return response;
  }
  
  @override
  Future<Either<Failure, DeviceResponse>> getDevice(int id) async {
    try {
      // Get token from client
      final token = _client.token();
      
      // Add token to headers
      final options = Options(headers: {
        'Authorization': 'Bearer $token',
      });

      final response = await _client.dio.get(
        '${ListAPI.device}?deviceId=$id',
        options: options,
      );
      
      if ((response.statusCode ?? 0) < 200 || (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      final res = Res<Map<String, dynamic>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json! as Map<String, dynamic>,
      );
      return Right(DeviceResponse.fromJson(res.data ?? {}));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? "Failed to get device"));
    }
  }

  @override
  Future<Either<Failure, RegisterDeviceRequest>> registerDevice(RegisterDeviceRequest request) async {
    try {
      final response = await _client.postRequest(
        ListAPI.registerDevice,
        data: request.toJson(),
        converter: (response) {
          final res = Res<Map<String, dynamic>>.fromJson(
            response as Map<String, dynamic>,
            (json) => json! as Map<String, dynamic>,
          );
          return RegisterDeviceRequest.fromJson(res.data ?? {});
        },
      );

      return response;
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? "Failed to register device"));
    }
  }
  
  @override
  Future<Either<Failure, DeviceResponse>> controlDevice(DeviceControlRequest request) async {
    try {
      // Get token from client
      final token = _client.token();
      
      // Add token to headers
      final options = Options(headers: {
        'Authorization': 'Bearer $token',
      });

      final response = await _client.dio.post(
        ListAPI.device,
        data: request.toJson(),
        options: options,
      );

      if ((response.statusCode ?? 0) < 200 || (response.statusCode ?? 0) > 201) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
        );
      }

      final res = Res<Map<String, dynamic>>.fromJson(
        response.data as Map<String, dynamic>,
        (json) => json! as Map<String, dynamic>,
      );
      return Right(DeviceResponse.fromJson(res.data ?? {}));
    } on DioException catch (e) {
      return Left(ServerFailure(e.message ?? "Failed to control device"));
    }
  }
}
