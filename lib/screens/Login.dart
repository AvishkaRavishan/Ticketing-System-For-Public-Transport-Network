import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/Home.dart';
import 'package:ticketingsystem/screens/Signup.dart';
import 'package:ticketingsystem/screens/UserHome.dart';
import 'package:ticketingsystem/screens/UserProfile.dart';

import 'Admin.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 10,
            clipBehavior: Clip.antiAlias,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/logo.jpg',
                      width: MediaQuery.of(context).size.width <= 100
                          ? MediaQuery.of(context).size.width * 0.6
                          : MediaQuery.of(context).size.width * 0.5,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Sign In",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 44.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                          controller: username,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "User Email",
                            prefixIcon: Icon(Icons.mail, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 26.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          controller: password,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "User Password",
                            prefixIcon: Icon(Icons.lock, color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: double.infinity,
                          child: RawMaterialButton(
                            fillColor: Colors.black,
                            elevation: 0.0,
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            onPressed: () async {
                              try {
                                final credential = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: username.text,
                                    password: password.text);
                                Fluttertoast.showToast(msg: "Successfully Login");
                                final db = FirebaseFirestore.instance;

                                await db
                                    .collection('user')
                                    .doc(username.text)
                                    .get()
                                    .then((DocumentSnapshot documentSnapshot) {

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserProfile()));
                                  if (documentSnapshot.get("role").toString() ==
                                      "user") {
                                    Navigator.push(
                                        context,

                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Home("vh", "title")));
                                  } else if (documentSnapshot
                                      .get("role")
                                      .toString() ==
                                      "admin") {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Admin("vh", "title")));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                UserHome("vh", "title")));
                                  }
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  Fluttertoast.showToast(
                                      msg: 'No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  Fluttertoast.showToast(
                                      msg:
                                      'Wrong password provided for that user.');
                                }
                              }
                              // Fluttertoast.showToast(msg:username.text);
                              //  print('a',username.text);
                            },
                            child: Text("Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have an Account?",
                              style: TextStyle(color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            InkWell(
                              child: Text("Signup"),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Signup()));
                              },
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 88.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
