import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class WebSocketManager {
  late StompClient _stompClient;
  final String _token;
  bool _isConnected = false;

  WebSocketManager(this._token);

  bool get isConnected => _isConnected;

  void connect() {
    _stompClient = StompClient(
      config: StompConfig(
        url: 'ws://13.211.227.100:8080/ws?token=$_token', // Kết nối đến /ws
        onConnect: (StompFrame frame) {
          print('Connected');
          // Subscribe vào /topic/updates
          _stompClient.subscribe(
            destination: '/topic/updates',
            callback: (StompFrame frame) {
              try {
                // Xử lý dữ liệu nhận được
                print('Received: ${frame.body}');
              } catch (e) {
                print('Error processing frame: $e');
              }
            },
          );
        },
        onStompError: (StompFrame frame) {
          print('STOMP Error: ${frame.body}');
        },
        onWebSocketError: (dynamic error) {
          print('WebSocket Error: $error');
        },
        onDisconnect: (StompFrame frame) {
          print('Disconnected');
        },
        stompConnectHeaders: {
          'Authorization': 'Bearer $_token', // Thêm Bearer token vào headers
        },
        webSocketConnectHeaders: {
          'Authorization': 'Bearer $_token', // Thêm Bearer token vào headers
        },
      ),
    );

    _stompClient.activate();
  }

  void disconnect() {
    _stompClient.deactivate();
  }

  // ... rest of the code ...
}