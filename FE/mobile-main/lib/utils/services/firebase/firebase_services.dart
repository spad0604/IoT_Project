import 'dart:isolate';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_auth_app/utils/utils.dart';

mixin FirebaseServices {
  static Future<void> init() async {
    /// Initialize Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // Pass all uncaught errors from the framework to Crashlytics.
    // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);

    /// Catch errors that happen outside of the Flutter context,
    Isolate.current.addErrorListener(
      RawReceivePort((List<dynamic> pair) async {
        final List<dynamic> errorAndStacktrace = pair;
        await FirebaseCrashlytics.instance.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last as StackTrace,
        );
      }).sendPort,
    );
  }

  static Future<String> get fcmToken async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return fcmToken ?? "";
  }

  static Future<String> get deviceId async {
    final deviceInfo = await DeviceInfoPlugin().deviceInfo;
    return deviceInfo.toString();
  }
}
