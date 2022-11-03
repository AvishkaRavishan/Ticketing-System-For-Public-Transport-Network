import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/Home.dart';
import 'package:ticketingsystem/screens/QRcode.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_core/firebase_core.dart';

class BusRegister extends StatefulWidget {
  @override
  State<BusRegister> createState() => _BusRegisterState();
}

class _BusRegisterState extends State<BusRegister> {
  late FirebaseAuth _firebaseAuth;
  TextEditingController email = TextEditingController();
  TextEditingController route = TextEditingController();
  TextEditingController vehicle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          BackButtonWidget(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.person), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: vehicle,
                          decoration: InputDecoration(hintText: 'Vehicle No'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.lock), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: route,
                          decoration: InputDecoration(hintText: 'Password'),
                        )))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                IconButton(icon: Icon(Icons.mail), onPressed: null),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 10),
                        child: TextField(
                          controller: email,
                          decoration: InputDecoration(hintText: 'Email'),
                        )))
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Radio(value: null, groupValue: null, onChanged: null),
                RichText(
                    text: TextSpan(
                        text: 'I have accepted the',
                        style: TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold))
                    ]))
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 60,
                child: RaisedButton(
                  onPressed: () {
                    if (vehicle.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed Vehicle !');
                    } else if (route.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed Route !');
                    } else if (email.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed  email!');
                    } else {
                      add(
                          email: email.text,
                          vehicle: vehicle.text,
                          route: route.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home(vehicle.text,
                                  ""))); //QrCode(vehicle.text, title: '',)
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Home(vehicle.text,
                                ""))); //QrCode(vehicle.text, title: '',)
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String?> add(
      {required String email,
      required String vehicle,
      required String route}) async {
    Map<String, String> map = {};
    map["email"] = email;
    map["route"] = route;
    map["vehicle"] = vehicle;
    try {
      FirebaseFirestore.instance.collection('buses').doc(vehicle).set(map);
      Fluttertoast.showToast(msg: 'Successfully Registered!.');
      return " ";
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: ' Registered Rejected !' + e.message.toString());
      return e.message;
    }
  }

  // 5
  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return "Signed out";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

// 6
  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
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
                        //  Navigator.push(context, MaterialPageRoute(builder: (context)=> QrCode()));
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
                'New BUS Register',
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
