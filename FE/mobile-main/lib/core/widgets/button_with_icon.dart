import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/resources/dimens.dart';
import 'package:flutter_auth_app/core/resources/styles.dart';

class ButtonWithIcon extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final String image;
  final double? width;
  final Color? color;
  final Color? titleColor;
  final double? fontSize;
  final Color? splashColor;
  final Color? borderColor;

  const ButtonWithIcon({
    super.key,
    required this.title,
    required this.image,
    required this.onPressed,
    this.width,
    this.color,
    this.titleColor,
    this.fontSize,
    this.splashColor,
    this.borderColor, // Thêm vào constructor
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor:
              color ?? Theme.of(context).extension<LzyctColors>()!.banner,
          foregroundColor:
              Theme.of(context).extension<LzyctColors>()!.buttonText,
          disabledBackgroundColor: color ??
              Theme.of(context)
                  .extension<LzyctColors>()!
                  .buttonText
                  ?.withOpacity(0.5),
          padding: EdgeInsets.symmetric(
            vertical: Dimens.space7,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(21)),
            side: BorderSide(
              color: borderColor ?? Colors.black,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 22,
              height: 22,
            ),
            SpacerH(
              value: Dimens.space6,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: fontSize ?? 13,
                fontWeight: FontWeight.bold,
                color: titleColor ??
                    Theme.of(context).extension<LzyctColors>()!.buttonText,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
