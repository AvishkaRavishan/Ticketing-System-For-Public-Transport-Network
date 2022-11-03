import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

class QrCode extends StatefulWidget {
  const QrCode(this.vh, {Key? key, required this.title}) : super(key: key);

  final String title;
  final String vh;

  @override
  State<QrCode> createState() => _QrCodeState(vh);
}

class _QrCodeState extends State<QrCode> {
  _QrCodeState(this.title);

  static GlobalKey previewContainer = new GlobalKey();
  final String title;
  final TextStyle textStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: previewContainer,
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: Divider(
                color: Colors.black26,
                //color of divider
                height: 5,
                //height spacing of divider
                thickness: 3,
                //thickness of divier line
                indent: 25,
                //spacing at the start of divider
                endIndent: 25, //spacing at the end of divider
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(title, style: textStyle),
            ),
            SizedBox(
              child: Center(
                child: Container(
                    child: QrImage(
                  data: title,
                  version: QrVersions.auto,
                  size: 250,
                )),
              ),
            ),
            TextButton.icon(
              onPressed: () async {
                final image = await QrPainter(
                  data: title,
                  version: QrVersions.auto,
                  errorCorrectionLevel: QrErrorCorrectLevel.Q,
                  embeddedImage: null,
                ).toImageData(400);

                //  downloadFile();
              },
              icon: Icon(Icons.move_down, size: 18),
              label: Text("DOWNLOAD"),
            ),
          ],
        ),
      ),
    );
  }
}

downloadFile(url) {
  AnchorElement anchorElement = new AnchorElement(href: url);
  anchorElement.download = "Flutter Logo";
  anchorElement.click();
}

class DividerThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.amber,
              child: const Center(
                child: Text('Start'),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text('End'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
