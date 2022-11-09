import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/BusList.dart';
import 'package:ticketingsystem/screens/PaymentList.dart';
import 'package:ticketingsystem/screens/QRcode.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_core/firebase_core.dart';
import 'package:ticketingsystem/screens/UserList..dart';
import 'BusRegister.dart';

class AddLocations extends StatefulWidget {
  const AddLocations({Key? key}) : super(key: key);
  @override
  State<AddLocations> createState() => _AddLocState();
}
class _AddLocState extends State<AddLocations> {
  late FirebaseAuth _firebaseAuth;
  TextEditingController route = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController locationNo = TextEditingController();

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
                          controller: route,
                          decoration: InputDecoration(hintText: 'Route No'),
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
                          controller: location,
                          decoration: InputDecoration(hintText: 'Location'),
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
                          controller: locationNo,
                          decoration: InputDecoration(hintText: 'Location No.'),
                        )))
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
                    if (route.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed Route No !');
                    } else if (location.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed Location !');
                    } else if (locationNo.text.isEmpty) {
                      Fluttertoast.showToast(msg: 'Required Filed Location No !');
                    } else {
                      add(
                          route: route.text,
                          location: location.text,
                          locationNo: locationNo.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>UserList()
                          ));
                    }
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserList()
                        ));
                  },
                  color: Color(0xFF00a79B),
                  child: Text(
                    'ADD',
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
      {required String route,
        required String location,
        required String locationNo}) async {
    Map<String, String> map = {};
    map["route"] = route;
    map["location"] = location;
    map["locationNo"] = locationNo;

    try {
      FirebaseFirestore.instance.collection('locations').doc(location).set(map);
      Fluttertoast.showToast(msg: 'Successfully Added!.');
      return " ";
    }
    on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
          msg: ' Rejected !' + e.message.toString());
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BusRegister()));
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
                    'Add Location',
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