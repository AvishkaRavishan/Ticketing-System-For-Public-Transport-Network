import 'package:flutter/material.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';


class PaymentList extends StatefulWidget {
  const PaymentList({Key? key}) : super(key: key);

  @override
  _PaymentListState createState() => _PaymentListState();
}

class _PaymentListState extends State<PaymentList> {
  List<String> items = [];
  ScrollController _scrollController = ScrollController();
  double indicator = 10.0;
  bool onTop = true;

  @override
  void initState() {
    super.initState();
    addItemsToTheList();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void addItemsToTheList() {
    for (int count = 0; count < 100; count++) {
      items.add('Person ' + (count + 1).toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Payment List'),
        ),
        body: Container(
          child: new ListView.builder(
              controller: _scrollController,
              itemCount: items.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Card(
                    child: ListTile(
                      title: Text(items[index]),
                    ));
              }),
        ),
        floatingActionButton: ScrollingFabAnimated(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          text: Text(
            'Add',
            style: TextStyle(color: Colors.white, fontSize: 16.0),
          ),
          onPress: () {},
          scrollController: _scrollController,
          animateIcon: true,
          inverted: false,
        ));
  }
}