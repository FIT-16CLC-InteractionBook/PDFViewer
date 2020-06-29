import 'dart:async';

import 'package:flutter/services.dart';

class PDFViewer {
  static const MethodChannel _channel =
      const MethodChannel('PDFViewer');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
