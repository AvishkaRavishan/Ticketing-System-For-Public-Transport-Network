import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  String dropdownvalue2 = 'Item 1';
  // List of inLocation in our dropdown menu
  var inLocation = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',

  ];
  var outLocation = [
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
        title: const Text("Travel Info"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "IN",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of inLocation
                items: inLocation.map((String inLocation) {
                  return DropdownMenuItem(
                    value: inLocation,
                    child: Text(inLocation),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue1) {
                  setState(() {
                    dropdownvalue = newValue1!;
                  });
                },
              ),
            ),


            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "OUT",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),


                DropdownButton(
                  // Initial Value
                  value: dropdownvalue2,
                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),
                  // Array list of outLocation
                  items: outLocation.map((String outLocation) {
                    return DropdownMenuItem(
                      value: outLocation,
                      child: Text(outLocation),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? newValue2) {
                    setState(() {
                      dropdownvalue2 = newValue2!;
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
    );
  }
}