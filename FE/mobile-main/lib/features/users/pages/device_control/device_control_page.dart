import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_auth_app/dependencies_injection.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_controller_request.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/users/pages/device_control/cubit/device_control_cubit.dart';
import 'package:flutter_auth_app/utils/services/hive/main_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeviceControlPage extends StatefulWidget {
  const DeviceControlPage({super.key});

  @override
  State<DeviceControlPage> createState() => _DeviceControlPageState();
}

class _DeviceControlPageState extends State<DeviceControlPage> {
  late final MainBoxMixin _mainBox = sl<MainBoxMixin>();
  late String? account = _mainBox.getData(MainBoxKeys.account);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DeviceControlCubit, DeviceControlState>(
        bloc: context.read<DeviceControlCubit>(),
        builder: (context, state) {
          DeviceResponse device = const DeviceResponse(
            id: 1,
            humidity: 0.0,
            led1: 0,
            led2: 0,
            temperature: 0.0
          );

          if (state is Loading) {
          } else if (state is Success) {
            device = state.device;
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Công tắc 2 nút V1',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
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
                              _buildButton(
                                  isOpen: device.led1 == 1,
                                  onTap: () {
                                    context
                                        .read<DeviceControlCubit>()
                                        .controlDevice(
                                          DeviceControlRequest(
                                            deviceId: 1,
                                            account: account ?? '',
                                            led1: device.led1 == 1 ? 0 : 1,
                                            led2: device.led2,
                                          ),
                                        );
                                  },
                                  title: 'Nút 1'),
                              _buildButton(
                                  isOpen: device.led2 == 1,
                                  onTap: () {
                                    context
                                        .read<DeviceControlCubit>()
                                        .controlDevice(DeviceControlRequest(
                                          deviceId: 1,
                                          account: account ?? '',
                                          led1: device.led1,
                                          led2: device.led2 == 1 ? 0 : 1,
                                        ));
                                  },
                                  title: 'Nút 2'),
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
                      _buttonExtension(
                          Icons.online_prediction_sharp, 'Bật tất cả', () {
                        context.read<DeviceControlCubit>().controlDevice(
                            DeviceControlRequest(
                                deviceId: 1,
                                account: account ?? '',
                                led1: 1,
                                led2: 1,
                                temperature: 0,
                                humidity: 0),);
                      }),
                      _buttonExtension(
                          Icons.timelapse_outlined, 'Hẹn giờ', () {}),
                      _buttonExtension(Icons.settings, 'Cài đặt', () {}),
                      _buttonExtension(Icons.gps_off_outlined, 'Tắt tất cả',
                          () {
                        context.read<DeviceControlCubit>().controlDevice(
                            DeviceControlRequest(
                                deviceId: 1,
                                account: account ?? '',
                                led1: 0,
                                led2: 0,
                                temperature: 0,
                                humidity: 0),);
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  Widget _buildButton(
      {required bool isOpen,
      required Function()? onTap,
      required String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget _buttonExtension(IconData icon, String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
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
      ),
    );
  }
}
