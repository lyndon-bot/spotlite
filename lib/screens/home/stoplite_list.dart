import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/models/stoplite.dart';

class StopliteList extends StatefulWidget {
  @override
  _StopliteListState createState() => _StopliteListState();
}

class _StopliteListState extends State<StopliteList> {
  @override
  Widget build(BuildContext context) {

    /*final Stoplites = Provider.of<List<Stoplite>>(context);
     Stoplites.forEach((stoplite) {
       print(stoplite.name);
       print(stoplite.sugars);
       print(stoplite.strength);
     });*/


    return ListView.builder(
      itemCount: Stoplites.length,
      itemBuilder: (context,index) {
       return StopliteTile(stoplite: Stoplites[index]);
      },
    );
  }
}
