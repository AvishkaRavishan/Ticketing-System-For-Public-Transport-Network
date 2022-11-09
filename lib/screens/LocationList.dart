import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LocationList extends StatefulWidget {


  @override
  State<LocationList> createState() => _LocationListState();
}

class _LocationListState extends State<LocationList> {
  String name = "";
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('locations').snapshots(),
          builder: (context, snapshots) {
            return (snapshots.connectionState == ConnectionState.waiting)
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshots.data!.docs[index].data()
                  as Map<String, dynamic>;


                  return ListTile(
                    title: Text(
                      data['location'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    // subtitle: Text(
                    //   data['email'],
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    //   style: TextStyle(
                    //       color: Colors.black54,
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // leading: CircleAvatar(
                    //   backgroundImage: NetworkImage(data['image']),
                    // ),
                  );
                }
              // if (data['name']
              //     .toString()
              //     .toLowerCase()
              //     .startsWith(name.toLowerCase())) {
              //   return ListTile(
              //     title: Text(
              //       data['name'],
              //       maxLines: 1,
              //       overflow: TextOverflow.ellipsis,
              //       style: TextStyle(
              //           color: Colors.black54,
              //           fontSize: 16,
              //           fontWeight: FontWeight.bold),
              //     ),
              //     // subtitle: Text(
              //     //   data['email'],
              //     //   maxLines: 1,
              //     //   overflow: TextOverflow.ellipsis,
              //     //   style: TextStyle(
              //     //       color: Colors.black54,
              //     //       fontSize: 16,
              //     //       fontWeight: FontWeight.bold),
              //     // ),
              //     // leading: CircleAvatar(
              //     //   backgroundImage: NetworkImage(data['image']),
              //     // ),
              //   );
              // }
              // return Container();
            );
          },
        )
    );
  }
}
