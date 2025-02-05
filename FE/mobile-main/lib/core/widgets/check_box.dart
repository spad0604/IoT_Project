import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';

class CheckBoxWidget extends StatelessWidget {
  final bool isChecked;
  final Function()? onChange;

  const CheckBoxWidget({super.key, required this.isChecked, this.onChange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChange!.call();
      },
      child: Container(
        height: 18,
        width: 18,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: isChecked == true ? Palette.colorBFF : Palette.color7ED,
            width: 1
          ),
          color: isChecked == true ? Palette.colorBFF : Colors.white
        ),
      ),
    );
  }
}
