import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_auth_app/features/auth/data/models/device_response.dart';
import 'package:flutter_auth_app/features/users/pages/device_control/cubit/device_control_cubit.dart';
import 'package:flutter_auth_app/utils/services/hive/main_box.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketConfig with MainBoxMixin {
  late StompClient stompClient;
  void Function(DeviceResponse)? onDeviceDataReceived; // Thêm callback

  void connectWebSocket() {
    final token = getData(MainBoxKeys.authToken) ?? getData(MainBoxKeys.generalToken);

    stompClient = StompClient(
      config: StompConfig(
        url: 'ws://13.211.227.100:8080/ws?token=$token',
        onConnect: onConnectCallBack,
        beforeConnect: () async {
          debugPrint("Connecting to WebSocket...");
          await Future.delayed(const Duration(seconds: 1));
        },
        onWebSocketError: (error) => debugPrint("WebSocket error: $error"),
        stompConnectHeaders: {'Authorization': 'Bearer $token'},
        webSocketConnectHeaders: {'Authorization': 'Bearer $token'},
        onStompError: (frame) => debugPrint("Stomp error: ${frame.body}"),
        onDisconnect: (_) => debugPrint("Disconnected from WebSocket"),
      ),
    );

    stompClient.activate();
  }

  void onConnectCallBack(StompFrame frame) {
    const topic = '/led_status/1';

    stompClient.subscribe(
      destination: topic,
      callback: (frame) {
        if (frame.body != null) {
          debugPrint("Received data: ${frame.body}");
          try {
            final dynamic raw = json.decode(frame.body!);

            // Đảm bảo raw là Map<String, dynamic> trước khi parse
            if (raw is Map<String, dynamic>) {
              final device = DeviceResponse.fromJson(raw);
              onDeviceDataReceived?.call(device);
            } else {
              debugPrint('Received data is not a valid JSON object: $raw');
            }
          } catch (e) {
            debugPrint('Parsing error: $e');
          }
        }
      },
    );
  }
}
