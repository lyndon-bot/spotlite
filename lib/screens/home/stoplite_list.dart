import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class StopliteList extends StatefulWidget {
  @override
  _StopliteListState createState() => _StopliteListState();
}

class _StopliteListState extends State<StopliteList> {
  @override
  Widget build(BuildContext context) {
    final Stoplites = Provider.of<QuerySnapshot>(context);
    //print(Stoplites.documents);
    for (var doc in Stoplites.documents) {
      print(doc.data);
    }
    return Container();
  }
}
