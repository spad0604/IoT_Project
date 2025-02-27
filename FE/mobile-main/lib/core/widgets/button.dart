import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

///*********************************************
/// Created by ukieTux on 23/04/2020 with ♥
/// (>’_’)> email : hey.mudassir@gmail.com
/// github : https://www.github.com/Lzyct <(’_’<)
///*********************************************
/// © 2020 | All Right Reserved
class Button extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final Color? borderColor;

  const Button({
    super.key,
    required this.title,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).extension<LzyctColors>()!.banner,
          foregroundColor: Theme.of(context).extension<LzyctColors>()!.buttonText,
          disabledBackgroundColor: color ?? Theme.of(context)
              .extension<LzyctColors>()!
              .buttonText
              ?.withOpacity(0.5),
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.space24,
            vertical: Dimens.space12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(32)),
            side: BorderSide(
              color: borderColor ?? Colors.black,
            ),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize ?? 13,
            fontWeight: FontWeight.bold,
            color: titleColor ?? Theme.of(context).extension<LzyctColors>()!.buttonText,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

