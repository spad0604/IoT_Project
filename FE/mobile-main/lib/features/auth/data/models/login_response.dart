import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    @JsonKey(name: "token") String? token,
    @JsonKey(name: "account") String? account,
  }) = _LoginResponse;

  const LoginResponse._();

  Login toEntity() => Login(token: "$token");

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
