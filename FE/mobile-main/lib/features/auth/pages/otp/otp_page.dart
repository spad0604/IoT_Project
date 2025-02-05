import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/widgets/otp_widget.dart';
import 'package:flutter_auth_app/features/auth/pages/otp/cubit/otp_cubit.dart';
import 'package:flutter_auth_app/utils/ext/context.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) => state.whenOrNull(
          success: (data) => context.goNamed(Routes.otp.name),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyAppBar(pageName: 'Mã OTP'),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        color: Palette.colorBFF,
                        Images.icProtect,
                        width: context.widthInPercent(25),
                      ),
                    ),
                    const SpacerV(
                      value: 12,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: const Text(
                        'Chúng tôi đã gửi cho bạn mã xác minh đến số điện thoại của bạn, vui lòng nhập số để xác minh',
                        style: TextStyle(
                            color: Palette.color752,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        softWrap: true,
                      ),
                    ),
                    const SpacerV(value: 50),
                    OtpWidget(otpController: otpController,),
                    const SpacerV(
                      value: 12,
                    ),
                    const Text.rich(
                      TextSpan(
                          text: 'Không nhận được mã OTP ? ',
                          style: TextStyle(
                              color: Palette.color752,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          children: [
                            TextSpan(
                                text: 'Gửi lại',
                                style: TextStyle(
                                    color: Palette.colorBFF,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14))
                          ]),
                    ),
                    const SpacerV(value: 200),
                    const Button(
                        fontSize: 13,
                        color: Palette.color0F0,
                        splashColor: Palette.color0F0,
                        borderColor: Palette.color0F0,
                        titleColor: Palette.colorA9A,
                        width: double.infinity,
                        title: 'Tiếp tục',
                        onPressed: null)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
