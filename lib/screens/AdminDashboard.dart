import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ticketingsystem/screens/QRcode.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:firebase_core/firebase_core.dart';

  void main() {
    runApp(
      Dashboard(
        items: List<String>.generate(10000, (i) => 'Item $i'),
      ),
    );
  }

class Dashboard extends StatefulWidget {
  final List<String> items;

  const Dashboard({required this.items});

  @override
  Widget build(BuildContext context) {
  const title = 'Long List';

  return MaterialApp(
  title: title,
  home: Scaffold(
  appBar: AppBar(
  title: const Text(title),
  ),
  body: ListView.builder(
  itemCount: items.length,
  prototypeItem: ListTile(
  title: Text(items.first),
  ),
  itemBuilder: (context, index) {
  return ListTile(
  title: Text(items[index]),
  );
  },
  ),
  ),
  );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
  }