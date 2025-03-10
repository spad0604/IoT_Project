import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._postLogin) : super(const _Loading());

  final PostLogin _postLogin;

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
    } catch (e) {
      emit(const _Failure("Có lỗi xảy ra"));
    }
  }

  void changeLoginMethod() {
    isLoginByEmail = !isLoginByEmail;
    emit(AuthState.changeMethod(isLoginByEmail));
  }
}
