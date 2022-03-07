import 'dart:developer';

import 'package:core/di/di_components.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'qrcode_reader_view.dart';

class QRCameraScreen extends StatelessWidget {
  const QRCameraScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QrcodeReaderView(
        onScan: (result) async {
          getIt.get<NavigationService>().goback(object: result);
        },
        headerWidget: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
      ),
    );
  }
}
