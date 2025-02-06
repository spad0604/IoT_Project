import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/features/general/general.dart';
import 'package:flutter_auth_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

///*********************************************
/// Created by ukietux on 24/08/20 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class SplashScreenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<GeneralTokenCubit, GeneralTokenState>(
        //coverage:ignore-start
        listener: (context, state) => state.whenOrNull(
          success: () => Future.delayed(const Duration(seconds: 2), () {
            context.goNamed(Routes.root.name);
          }),
        ),
        //coverage:ignore-end
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            colors: [Palette.color6F9, Palette.colorDFF],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Center(
            child: Image.asset(
              color: Colors.white,
              Theme.of(context).brightness == Brightness.dark
                  ? Images.icLogo
                  : Images.icLogo,
              width: context.widthInPercent(55),
            ),
          ),
        ),
      ),
    );
  }
}
