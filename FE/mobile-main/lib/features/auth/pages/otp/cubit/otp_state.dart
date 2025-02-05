part of 'otp_cubit.dart';

@freezed
class OtpState with _$OtpState {
  const factory OtpState.loading() = _Loading;
  const factory OtpState.success(String? data) = _Success;
  const factory OtpState.failure(String message) = _Failure;
  const factory OtpState.summitOtp(String? data) = SummitOtp;
  const factory OtpState.init() = _Init;
}
