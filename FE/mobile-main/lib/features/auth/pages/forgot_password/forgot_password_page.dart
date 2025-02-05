import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/auth/auth.dart';
import 'package:flutter_auth_app/features/general/pages/cubit/reload_form_cubit.dart';
import 'package:flutter_auth_app/utils/ext/context.dart';
import 'package:flutter_auth_app/utils/ext/ext.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = GetIt.instance<AuthCubit>();

    /// Global key
    final _formValidator = <String, bool>{};

    return BlocBuilder<AuthCubit, AuthState>(
        bloc: bloc,
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Column(
              children: [
                const MyAppBar(pageName: 'Mã OTP'),
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          color: Palette.colorBFF,
                          Images.icProtect,
                          width: context.widthInPercent(25),
                        ),
                      ),
                      const SpacerV(
                        value: 24,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 36),
                        child: const Text(
                          'Vui lòng nhập địa chỉ email của bạn để yêu cầu đặt lại mật khẩu',
                          style: TextStyle(
                              color: Palette.color752,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                      const SpacerV(value: 24),
                      const Text(
                        textAlign: TextAlign.start,
                        'Email',
                        style: TextStyle(
                            color: Palette.color915,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      TextF(
                        validatorListener: (String value) {
                          _formValidator["email"] = value.isValidEmail();
                          context.read<ReloadFormCubit>().reload();
                        },
                        errorMessage: Strings.of(context)!.errorInvalidEmail,
                        textStyle: const TextStyle(
                          color: Palette.color915,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        autoFillHints: const [AutofillHints.email],
                        isValid: _formValidator.putIfAbsent(
                          "email",
                              () => false,
                        ),
                        key: const Key("email"),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        label: 'Email',
                        prefixIcon:
                            Image.asset(width: 14, height: 14, Images.icLetter),
                        hint: '| Nhập Email',
                      ),
                      SpacerV(value: 200),
                      // Button(
                      //     color: ,
                      //     title: 'Tiếp tục',
                      //     onPressed:
                      // )
                    ],
                  ),
                )
              ],
            )),
          );
        });
  }
}
