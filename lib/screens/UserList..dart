import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class UserList extends StatefulWidget {
  @override
  State<UserList> createState() => _UserListState();
}
class _UserListState extends State<UserList> {
  String name = "User Name";
  String role = "User Role";
  String address = "User Address";
  String nic = "User NIC";
  String mobile = "User Phone";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('User').snapshots(),
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


            return Center(
                    child: SizedBox(
                      width: 400,
                      height: 180,
                      child: Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Text("Name:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: Text(
                                    data['name'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    /* ... */
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Text("Address:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: Text(
                                    data['address'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    /* ... */
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Text("NIC:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: Text(
                                    data['nic'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    /* ... */
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Card(
                                  child: Text("Phone No:",
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                TextButton(
                                  child: Text(
                                    data['mobile'],
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    /* ... */
                                  },
                                ),
                                const SizedBox(width: 8),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const <Widget>[
                                Icon(
                                  Icons.edit,
                                  color: Colors.pink,
                                  size: 24.0,
                                  semanticLabel: 'Text to announce in accessibility modes',
                                ),
                                Icon(
                                  Icons.delete,
                                  color: Colors.green,
                                  size: 30.0,




                                ),
                                Icon(
                                  Icons.read_more,
                                  color: Colors.blue,
                                  size: 36.0,
                                ),
                              ],
                            )

                          ],
                        ),
                        // clipBehavior is necessary because, without it, the InkWell's animation
                        // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
                        // This comes with a small performance cost, and you should not set [clipBehavior]
                        // unless you need it.
                      ),
                    ),
                  );

                }

                );
      },
    ));
  }
}
