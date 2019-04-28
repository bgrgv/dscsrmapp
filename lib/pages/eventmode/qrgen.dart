import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  @override
  _QrDisplay createState() => _QrDisplay();
}

class _QrDisplay extends State<QrScreen> {
  String qrData = 'DSC SRM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _qrWidget(),
      resizeToAvoidBottomPadding: true,
    );
  }

  Widget _qrWidget() {
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 30.0,
              right: 30.0,
              bottom: 20.0,
            ),
          ),
          Container(
            child: new Text(
              "Please show this QR for completing\nyour registration.",
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: QrImage(
                  data: qrData,
                  gapless: true,
                  foregroundColor: Colors.black,
                  version: 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
