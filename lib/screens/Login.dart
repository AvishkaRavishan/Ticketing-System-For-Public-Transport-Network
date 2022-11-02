import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/Signup.dart';

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
      body: Column(
        children: [
          Image.asset(
            'assets/logo.jpg',
            width: 100,
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
                    "Knight Watch",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
                    height: 12.0,
                  ),
                  const Text(
                    "Don't remember your password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                  const SizedBox(
                    height: 88.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: RawMaterialButton(
                      fillColor: Color(0xFF0069FE),
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
                          Fluttertoast.showToast(msg:"Successfully Login");
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            Fluttertoast.showToast(msg:'No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            Fluttertoast.showToast(msg:'Wrong password provided for that user.');
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
