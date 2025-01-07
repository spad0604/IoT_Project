import 'package:flutter/material.dart';

class DrawerCustomWidget extends StatelessWidget {
  const DrawerCustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              title: const Text('Home'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Business'),
              selected: false,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('School'),
              selected: false,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
