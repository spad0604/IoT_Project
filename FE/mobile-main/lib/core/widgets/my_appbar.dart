import 'package:flutter/material.dart';
import 'package:flutter_auth_app/core/core.dart';
import 'package:flutter_auth_app/core/resources/palette.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget{
  const MyAppBar({required this.pageName});

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                Expanded(
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      pageName,
                      style: const TextStyle(
                          color: Palette.color915,
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SpacerV(value: 12),
            const Divider(color: Palette.color5F9,)
          ],
        ),
      ),
    );
  }
}
