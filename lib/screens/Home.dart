import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'QRcode.dart';
import 'QrScanner.dart';

class Home extends StatefulWidget {
  const Home(this.vh, this.title);

  final String title;
  final String vh;

  @override
  State<Home> createState() => _HomeState(vh);
}

class _HomeState extends State<Home> {
  _HomeState(this.vehicle);

  String vehicle;

  @override
  Widget build(BuildContext context) {
    IconData qr_code_scanner_rounded =
        IconData(0xf00cc, fontFamily: 'MaterialIcons');
    final TextStyle textStyle = TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );
    return MaterialApp(
        home: Center(
            child: Scaffold(
      appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(70),
                  bottomLeft: Radius.circular(70)))),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.height * 0.25,
          height: MediaQuery.of(context).size.height * 0.25,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QrCode(vehicle, title: '')));
            },
            child: Card(
                elevation: 10,
                color: Colors.white,
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: Icon(qr_code_scanner_rounded,
                                size: 50.0, color: Colors.black)),
                        Text("QR Code", style: textStyle),
                      ]),
                )),
          ),
        ),
      ),
    )));
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({required this.choice});

  final String choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: 24,
      color: Colors.green,
      fontWeight: FontWeight.bold,
    );
    IconData qr_code_scanner_rounded =
        IconData(0xf00cc, fontFamily: 'MaterialIcons');
    return Card(
        color: Colors.white70,
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: Icon(qr_code_scanner_rounded,
                        size: 50.0, color: textStyle.color)),
                Text(choice, style: textStyle),
              ]),
        ));
  }
}
