import 'package:flutter/services.dart';

class UnityLauncher {
  static const MethodChannel _channel = MethodChannel('unity_launcher');

  static Future<void> openBlazion() async {
    try {
      await _channel.invokeMethod('openBlazion');
    } catch (e) {
      print("Unity launch error: $e");
    }
  }
}
