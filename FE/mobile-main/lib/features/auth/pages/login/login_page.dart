import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/widgets/check_box.dart';
import 'package:flutter_auth_app/features/auth/pages/login/widget/login_with_another_method.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  /// Controller
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();

  bool _isPasswordVisible = false;

  /// Focus Node
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();

  /// Global key
  final _formValidator = <String, bool>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: AutofillGroup(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.pop();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Palette.colorD94,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                          Image.asset(
                            Theme.of(context).brightness == Brightness.dark
                                ? Images.icLogo
                                : Images.icLogo,
                            width: context.widthInPercent(30),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Chào mừng bạn trở lại!',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(height: 50),
                          _loginForm(),
                          const SizedBox(height: 12),
                          loginWithAnotherMethod(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text.rich(
                  TextSpan(
                    text: 'Bằng cách đăng nhập bạn đồng ý với chúng tôi ',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Palette.color915,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Điều khoản sử dụng ',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.colorBFF,
                          decorationColor: Palette.colorBFF,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                      const TextSpan(
                        text: 'và ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Palette.colorF9B,
                        ),
                      ),
                      TextSpan(
                        text: 'Chính sách đăng nhập',
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.colorBFF,
                          decorationColor: Palette.colorBFF,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                    ],
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginForm() => BlocBuilder<ReloadFormCubit, ReloadFormState>(
        builder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Email',
                  style: TextStyle(
                      color: Palette.color915,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              SpacerV(
                value: Dimens.space10,
              ),
              TextF(
                textStyle: const TextStyle(
                  color: Palette.color915,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                autoFillHints: const [AutofillHints.email],
                key: const Key("email"),
                focusNode: _fnEmail,
                textInputAction: TextInputAction.next,
                controller: _conEmail,
                hint: "Nhập tên đăng ký",
                label: Strings.of(context)!.email,
                errorMessage: Strings.of(context)!.errorInvalidEmail,
              ),
              SpacerV(
                value: Dimens.space4,
              ),
              const Text('Mật khẩu',
                  style: TextStyle(
                      color: Palette.color915,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
              SpacerV(
                value: Dimens.space12,
              ),
              TextF(
                textStyle: const TextStyle(
                  color: Palette.color915,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                autoFillHints: const [AutofillHints.password],
                key: const Key("password"),
                focusNode: _fnPassword,
                textInputAction: TextInputAction.done,
                controller: _conPassword,
                keyboardType: TextInputType.text,
                obscureText: !_isPasswordVisible,
                hint: 'Nhập mật khẩu',
                label: Strings.of(context)!.password,
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: () {
                    _isPasswordVisible = !_isPasswordVisible;
                    context.read<ReloadFormCubit>().reload();
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                ),
                isValid: _formValidator.putIfAbsent(
                  "password",
                  () => false,
                ),
                validatorListener: (String value) {
                  _formValidator["password"] = value.length > 5;
                  context.read<ReloadFormCubit>().reload();
                },
                errorMessage: Strings.of(context)!.errorPasswordLength,
              ),
              SpacerV(value: Dimens.space14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CheckBoxWidget(
                        isChecked: false,
                      ),
                      SpacerH(value: Dimens.space8),
                      const Text('Ghi nhớ tài khoản',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Palette.colorD94))
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.pushNamed(Routes.forgotPassword.name);
                    },
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                          color: Palette.colorBFF,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SpacerV(value: Dimens.space24),
              Button(
                  borderColor: Palette.colorBFF,
                  fontSize: 13,
                  splashColor: Palette.colorBFF,
                  titleColor: Colors.white,
                  color: Palette.colorBFF,
                  title: 'Đăng nhập',
                  width: double.maxFinite,
                  onPressed: () => //context.pushNamed(Routes.otp.name)
                      context.read<AuthCubit>().login(
                            LoginParams(
                              account: _conEmail.text,
                              password: _conPassword.text,
                            ),
                          )),
              SpacerV(value: Dimens.space4),
              Button(
                  borderColor: Palette.colorBFF,
                  fontSize: 13,
                  titleColor: Palette.colorBFF,
                  color: Colors.white,
                  title: 'Đăng ký ngay',
                  width: double.maxFinite,
                  onPressed: () => context.pushNamed(Routes.register.name)),
              SpacerV(value: Dimens.space36),
              const Center(
                child: Text(
                  textAlign: TextAlign.center,
                  'Hoặc đăng nhập',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Palette.color6A1),
                ),
              )
            ],
          );
        },
      );
}
