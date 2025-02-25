import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/resources/dimens.dart';
import 'package:flutter_auth_app/core/resources/images.dart';
import 'package:flutter_auth_app/core/resources/palette.dart';
import 'package:flutter_auth_app/core/widgets/button_with_icon.dart';
import 'package:flutter_auth_app/core/widgets/spacer_h.dart';
import 'package:flutter_auth_app/features/auth/pages/login/cubit/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget loginWithAnotherMethod() {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      bool isLoginByEmail = true;

      if (state is ChangeMethod) {
        isLoginByEmail = state.isLoginByEmail;
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: ButtonWithIcon(
              title: 'Với Google',
              image: Images.icGoogle,
              onPressed: null,
              borderColor: Palette.color9EF,
              color: Colors.white,
              titleColor: Palette.color915,
              fontSize: 14,
            ),
          ),
          SpacerH(
            value: Dimens.space12,
          ),
          if (isLoginByEmail == true)
            Expanded(
              child: ButtonWithIcon(
                title: 'Với số điện thoại',
                image: Images.icPhone,
                onPressed: () =>
                    context.read<AuthCubit>().changeLoginMethod(),
                borderColor: Palette.color9EF,
                color: Colors.white,
                splashColor: Colors.white,
                titleColor: Palette.color915,
                fontSize: 14,
              ),
            )
          else
            Expanded(
              child: ButtonWithIcon(
                title: 'Với Email',
                image: Images.icEmail,
                onPressed: () =>
                    context.read<AuthCubit>().changeLoginMethod(),
                borderColor: Palette.color9EF,
                color: Colors.white,
                splashColor: Colors.white,
                titleColor: Palette.color915,
                fontSize: 14,
              ),
            ),
        ],
      );
    },
  );
}
