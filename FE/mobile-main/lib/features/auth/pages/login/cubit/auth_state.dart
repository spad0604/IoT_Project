part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.loading() = _Loading;

  const factory AuthState.success(String? data) = _Success;

  const factory AuthState.failure(String message) = _Failure;

  const factory AuthState.showHide() = _ShowHide;

  const factory AuthState.changeMethod(bool isLoginByEmail) = ChangeMethod;

  const factory AuthState.init({@Default(false) bool isEmailForgotPassword}) = _Init;
}
