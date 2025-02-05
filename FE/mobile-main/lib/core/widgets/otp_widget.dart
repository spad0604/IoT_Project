import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_app/core/resources/palette.dart';
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  const OtpWidget({super.key, required this.otpController});

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: 74,
      width: 50,
      textStyle: const TextStyle(
          fontSize: 24, color: Palette.color915, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 7),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Palette.color5F9),
        borderRadius: BorderRadius.circular(4),
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Palette.color0F5,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Palette.colorBFF),
      borderRadius: BorderRadius.circular(4),
    );
    return Pinput(
      controller: otpController,
      submittedPinTheme: submittedPinTheme,
      focusedPinTheme: focusedPinTheme,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      length: 6,
      defaultPinTheme: defaultPinTheme,
    );
  }
}
