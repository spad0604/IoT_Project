import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/data/models/register_device_request.dart';
import 'package:flutter_auth_app/features/auth/domain/usecases/register_device_uc.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/services/firebase/firebase_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin, this._registerDeviceUC) : super(const _Loading());

  final PostLogin _postLogin;

  final RegisterDeviceUC _registerDeviceUC;

  bool isLoginByEmail = false;

  Future<void> login(LoginParams params) async {
    emit(const _Loading());
    try {
      final data = await _postLogin.call(params);

      final registerDevice = await _registerDeviceUC.call(RegisterDeviceRequest(
        fcmToken: await FirebaseServices.fcmToken,
        deviceId: await FirebaseServices.deviceId,
        account: params.account,
      ));

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
    } catch (e) {
      emit(const _Failure("Có lỗi xảy ra"));
    }
  }

  void changeLoginMethod() {
    isLoginByEmail = !isLoginByEmail;
    emit(AuthState.changeMethod(isLoginByEmail));
  }
}
