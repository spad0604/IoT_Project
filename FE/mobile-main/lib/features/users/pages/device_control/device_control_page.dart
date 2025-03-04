import 'package:flutter/material.dart';

class DeviceControlPage extends StatelessWidget {
  const DeviceControlPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Công tắc 2 nút V1',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  height: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFFFEE3EC), // Light pink
                        Color(0xFFFCD5E2), // Slightly darker pink
                      ],
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: const Color(0xff383637)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildButton(isOpen: true, onTap: () {}, title: 'Nút 1'),
                          _buildButton(isOpen: false, onTap: () {}, title: 'Nút 2'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 120,
              color: const Color(0xFF262547),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buttonExtension(Icons.online_prediction_sharp, 'Bật tất cả', () {}),
                  _buttonExtension(Icons.timelapse_outlined, 'Hẹn giờ', () {}),
                  _buttonExtension(Icons.settings, 'Cài đặt', () {}),
                  _buttonExtension(Icons.gps_off_outlined, 'Tắt tất cả', () {}),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildButton(
      {required bool isOpen,
      required Function()? onTap,
      required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: isOpen ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xff383637),
                  borderRadius: BorderRadius.circular(22.5)),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buttonExtension(IconData icon, String title, Function()? onTap) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 24,
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
