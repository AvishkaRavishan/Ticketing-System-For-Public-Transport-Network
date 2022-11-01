import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
      title: Text("Login",
      style: TextStyle(fontWeight: FontWeight.bold),
      
      ),
      centerTitle: true,
      iconTheme:IconThemeData(color: Color.fromARGB(255, 23,192, 0, )) ,
      elevation: 0,
     ) );
  }
}