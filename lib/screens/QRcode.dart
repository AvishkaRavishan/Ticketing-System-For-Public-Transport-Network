import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
class QrCode extends StatefulWidget {

  @override
  State<QrCode> createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Center(
        child: Container(child: QrImage(
          data: 'Doolshe.com',
          version: QrVersions.auto,
          size: 320,
        )),
      ),
    );
  }
}
