import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/websocket/websocket_manager.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/register_device_uc.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/services/firebase/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final WebSocketConfig webSocketConfig = WebSocketConfig();

  AuthCubit(this._postLogin, this._registerDeviceUC) : super(const _Loading());

  final PostLogin _postLogin;

  final RegisterDeviceUC _registerDeviceUC;

  bool isLoginByEmail = false;

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    try {
      final data = await _postLogin.call(params);

      data.fold(
        (l) {
          if (l is ServerFailure) {
            emit(_Failure(l.message ?? ""));
          }
        },
        (r) {
          emit(_Success(r.token));
        },
      );

      String _fcmToken = await FirebaseServices.fcmToken;
      String _deviceId = "1234567890";

      final request = RegisterDeviceRequest(
        fcmToken: _fcmToken,
        deviceId: _deviceId,
        account: params.account,
      );
      await _registerDeviceUC.call(request);

      webSocketConfig.connectWebSocket();
    } catch (e) {
      emit(const _Failure("Có lỗi xảy ra"));
    }
  }

  void changeLoginMethod() {
    isLoginByEmail = !isLoginByEmail;
    emit(AuthState.changeMethod(isLoginByEmail));
  }
}
