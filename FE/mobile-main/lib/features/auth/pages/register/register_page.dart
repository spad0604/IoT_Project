import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/widgets/check_box.dart';
import 'package:flutter_auth_app/features/features.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

///*********************************************
///  flutter_auth_app |
///  register_page.dart
/// --------------------------------------------
/// Created by Mudassir 🧑🏻‍💻 @ lazycatlabs.com
/// on 📅 13/09/21 🕰 21:21 with ❤️
/// ✉️ : hey.mudassir@gmail.com
/// 🚀 : https://www.github.com/Lzyct
/// 🌐 : https://www.lazycatlabs.com
///*********************************************
/// © 2021 | All Right Reserved

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  /// Controller
  final _conName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassword = TextEditingController();
  final _conPasswordRepeat = TextEditingController();

  /// Focus Node
  final _fnName = FocusNode();
  final _fnEmail = FocusNode();
  final _fnPassword = FocusNode();
  final _fnPasswordRepeat = FocusNode();

  /// isPasswordVisible
  bool _isPasswordVisible = false;
  bool _isPasswordRepeatVisible = false;

  final _formValidator = <String, bool>{};

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (_, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();

              data?.message?.toToastSuccess(context);

              /// back to login page after register success
              context.pop();
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Dimens.space12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Palette.colorD94,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.pushNamed(Routes.login.name);
                        },
                        child: const Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontSize: 14,
                              color: Palette.colorBFF,
                              fontWeight: FontWeight.w400,
                            )
                        ),
                      )
                    ],
                  ),
                  SpacerV(value: 12,),
                  Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                        ? Images.icLogo
                        : Images.icLogo,
                    width: context.widthInPercent(30),
                  ),
                  SpacerV(value: Dimens.space12),
                  const Text(
                    'Đăng ký tài khoản',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                  const SpacerV(value: 36),
                  _registerForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _registerForm() {
    return BlocBuilder<ReloadFormCubit, ReloadFormState>(
      builder: (_, __) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tên đăng ký',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.color915),
            ),
            const SpacerV(value: 10),
            TextF(
              key: const Key("name"),
              focusNode: _fnName,
              textInputAction: TextInputAction.next,
              controller: _conName,
              keyboardType: TextInputType.emailAddress,
              hint: 'Nhập tên đăng ký',
              label: Strings.of(context)!.name,
              isValid: _formValidator.putIfAbsent(
                "name",
                () => false,
              ),
              validatorListener: (String value) {
                _formValidator["name"] = value.isNotEmpty;
                context.read<ReloadFormCubit>().reload();
              },
              errorMessage: Strings.of(context)!.errorEmptyField,
            ),
            const SpacerV(value: 8),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.color915),
            ),
            const SpacerV(value: 10),
            TextF(
              key: const Key("email"),
              focusNode: _fnEmail,
              textInputAction: TextInputAction.next,
              controller: _conEmail,
              keyboardType: TextInputType.emailAddress,
              hint: 'Email',
              label: Strings.of(context)!.email,
              isValid: _formValidator.putIfAbsent(
                "email",
                () => false,
              ),
              validatorListener: (String value) {
                _formValidator["email"] = value.isValidEmail();
                context.read<ReloadFormCubit>().reload();
              },
              errorMessage: Strings.of(context)!.errorInvalidEmail,
            ),
            const SpacerV(value: 8),
            const Text(
              'Mật khẩu',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.color915),
            ),
            const SpacerV(value: 10),
            TextF(
              key: const Key("password"),
              focusNode: _fnPassword,
              textInputAction: TextInputAction.next,
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
                  !_isPasswordVisible ? Icons.visibility_off : Icons.visibility,
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
              semantic: "password",
            ),
            const SpacerV(value: 8),
            const Text(
              'Xác nhận mật khẩu',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Palette.color915),
            ),
            const SpacerV(value: 10),
            TextF(
              key: const Key("repeat_password"),
              focusNode: _fnPasswordRepeat,
              textInputAction: TextInputAction.done,
              controller: _conPasswordRepeat,
              keyboardType: TextInputType.text,
              obscureText: !_isPasswordRepeatVisible,
              hint: 'Nhập lại mật khẩu',
              label: Strings.of(context)!.passwordRepeat,
              suffixIcon: IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  _isPasswordRepeatVisible = !_isPasswordRepeatVisible;
                  context.read<ReloadFormCubit>().reload();
                },
                icon: Icon(
                  !_isPasswordRepeatVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
              isValid: _formValidator.putIfAbsent(
                "repeat_password",
                () => false,
              ),
              validatorListener: (String value) {
                _formValidator["repeat_password"] = value == _conPassword.text;
                context.read<ReloadFormCubit>().reload();
              },
              errorMessage: Strings.of(context)!.errorPasswordNotMatch,
              semantic: "repeat_password",
            ),
            const Row(children: [
              CheckBoxWidget(isChecked: false),
              SpacerH(value: 8),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    text: 'Tôi đồng ý với điều khoản của Nex với ',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Palette.colorF9B,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Chính sách bảo mật ',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.colorBFF,
                        ),
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
                        text: 'Chính sách Cookie',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Palette.colorBFF,
                        ),
                      ),
                    ],
                  ),
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              )
            ]),
            SpacerV(value: Dimens.space24),
            Button(
              titleColor: Colors.white,
              color: Palette.colorBFF,
              borderColor: Palette.colorBFF,
              fontSize: 13,
              key: const Key("btn_register"),
              width: double.maxFinite,
              splashColor: Palette.colorBFF,
              title: 'Đăng ký',
              onPressed: () {
                context.pushNamed(Routes.otp.name);
              }
              // _formValidator.validate()
              //     ? () {
              //         /// Validate form first
              //         context.read<RegisterCubit>().register(
              //               RegisterParams(
              //                 name: _conName.text,
              //                 email: _conEmail.text,
              //                 password: _conPassword.text,
              //               ),
              //             );
              //       }
              //     : null,
            ),
            const SpacerV(value: 46),
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Align(
                alignment: Alignment.bottomCenter,
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
            )
          ],
        );
      },
    );
  }
}
