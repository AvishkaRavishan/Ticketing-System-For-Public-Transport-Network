import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/Login.dart';
import 'package:ticketingsystem/screens/QRcode.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_core/firebase_core.dart';

import 'TravelInfo.dart';

class TravelInfo extends StatefulWidget {
  const TravelInfo({Key? key}) : super(key: key);

  @override
  State<TravelInfo> createState() => _TravelInfoState();
}

class _TravelInfoState extends State<TravelInfo> {
  late FirebaseAuth _firebaseAuth;
  TextEditingController start = TextEditingController();
  TextEditingController end = TextEditingController();
  // Initial Selected Value
  String dropdownvalue = 'Item 1';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Destination"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Out Location",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton(
              // Initial Value
              value: dropdownvalue,
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Out Location",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                DropdownButton(
                  // Initial Value
                  value: dropdownvalue,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of items
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownvalue = newValue!;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage('assets/logo.jpg'))),
      child: Positioned(
          child: Stack(
        children: <Widget>[
          Positioned(
              top: 20,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }),
                  Text(
                    'Back',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              )),
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Create New Account',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          )
        ],
      )),
    );
  }
}
