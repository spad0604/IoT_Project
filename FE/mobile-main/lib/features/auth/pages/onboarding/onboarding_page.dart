import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/utils/ext/context.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Images.icLogo,
                      width: context.widthInPercent(30),
                    ),
                    const SpacerV(value: 36),
                    _buildButton(
                        title: 'Tiếp tục với Google',
                        image: Images.icGoogle,
                        onPressed: () => context.pushNamed(Routes.login.name)),
                    const SpacerV(value: 12),
                    _buildButton(
                        title: 'Tiếp tục với Email',
                        image: Images.icEmail,
                        onPressed: () => context.pushNamed(Routes.login.name)),
                    const SpacerV(value: 12),
                    _buildButton(
                        title: 'Tiếp tục với Số điện thoại',
                        image: Images.icPhone,
                        onPressed: () => context.pushNamed(Routes.login.name)),
                    const SpacerV(value: 200),
                    Text.rich(TextSpan(
                        text: 'Chưa có tài khoản? ',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Palette.color915,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Đăng ký',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Palette.colorBFF,
                                decorationColor: Palette.colorBFF,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.pushNamed(Routes.register.name);
                                }),
                        ]))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: Text.rich(
                  TextSpan(
                    text: 'Bằng cách đăng nhập bạn đồng ý với chúng tôi ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Palette.color915,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Điều khoản sử dụng ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.colorBFF,
                            decorationColor: Palette.colorBFF,
                            decoration: TextDecoration.underline),
                      ),
                      TextSpan(
                        text: 'và ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Palette.colorF9B,
                        ),
                      ),
                      TextSpan(
                        text: 'Chính sách đăng nhập',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Palette.colorBFF,
                            decorationColor: Palette.colorBFF,
                            decoration: TextDecoration.underline),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
      {required String title,
      required String image,
      required Function()? onPressed}) {
    return GestureDetector(
      onTap: () {
        onPressed!.call();
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(60),
            color: Palette.colorBFF.withOpacity(0.1)),
        padding: const EdgeInsets.symmetric(vertical: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 22,
              height: 22,
            ),
            const SpacerH(value: 8),
            DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.color915,
                ),
                child: Text(title)),
          ],
        ),
      ),
    );
  }
}
