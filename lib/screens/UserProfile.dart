import 'dart:convert';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UserProfile extends StatefulWidget {
  String name = "User Name";
  String role = "User Role";
  String address = "User Address";
  String nic = "User NIC";
  String mobile = "User Phone";

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  static GlobalKey previewContainer = new GlobalKey();
  final String name="Coco Xu";
  final TextStyle textStyle = TextStyle(
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );


  final String email="avishk@gmail.com";
  final TextStyle text2Style = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  final String phone="0777218734";
  final TextStyle text3Style = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  final String nic="991735763V";
  final TextStyle text4Style = TextStyle(
    fontSize: 18,
    color: Colors.black,
  );
  final String age="24 years";
  final TextStyle text5Style = TextStyle(
    fontSize: 18,
    color: Colors.black,
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
              padding: const EdgeInsets.only(left: 20,right:20 ,top:8.0 ,bottom: 40),
              child: Text(name, style: textStyle),
                  ),
            RawMaterialButton(
              onPressed: () {},
              elevation: 2.0,
              fillColor: Colors.white,
              child: const Icon(
                Icons.supervised_user_circle_outlined,
                size: 200.0,

              ),
              // padding: EdgeInsets.all(5.0),
              shape: const CircleBorder(),
            )  ,
            Padding(
                padding: const EdgeInsets.only(left: 20,right:20 ,top:30 ,bottom: 8.0),
                child: Text(email, style: text2Style),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(phone, style: text3Style),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(nic, style: text4Style),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20,right:20 ,top:8.0 ,bottom: 40),
                child: Text(age, style: text5Style),
            ),

            SizedBox(
              width: 150,
              height: 35,
              child: ElevatedButton(
                style: ButtonStyle(

                  backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                        return Colors.black;
                       // Use the component's default.
                    },
                  ),
                  side: MaterialStateProperty.resolveWith<BorderSide>(
                          (Set<MaterialState> states) {
                        final Color color = states.contains(MaterialState.pressed)
                            ? Colors.black12
                            : Colors.black;
                        return BorderSide(color: color, width: 2);
                      }
                  ),
                ),

                onPressed: () { },
                child: Text('Edit'),
              ),
            )


          ],
        ),
      ),
    );
  }
}

