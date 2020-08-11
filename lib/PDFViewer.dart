// import 'dart:async';

// import 'package:flutter/services.dart';

// class PDFViewer {
//   static const MethodChannel _channel =
//       const MethodChannel('PDFViewer');

//   static Future<String> get platformVersion async {
//     final String version = await _channel.invokeMethod('getPlatformVersion');
//     return version;
//   }
// }

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PDFViewer extends StatefulWidget {
  final String pdfUrl;

  PDFViewer({Key key, this.pdfUrl}) : super(key: key);

  PDFViewController pdfViewController;

  @override
  State<StatefulWidget> createState() => PDFViewerState();
}

class PDFViewerState extends State<PDFViewer> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'pdfview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return UiKitView(
        viewType: 'pdfview',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    }
    // TODO add other platforms
    return Text(
        '$defaultTargetPlatform is not yet supported by the map view plugin');
  }

  void _onPlatformViewCreated(int id) {
    widget.pdfViewController = new PDFViewController(id, widget.pdfUrl);
  }
}

class PDFViewController {
  PDFViewController(int id, String pdfUrl) {
    this._channel = new MethodChannel('pdfview$id');
    this._channel.invokeMethod('initializePDF', pdfUrl);
  }

  MethodChannel _channel;

  Future<void> changePage(int index) async {
    return _channel.invokeMethod('changePage', index);
  }
}
