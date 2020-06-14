import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/models/stoplite.dart';
import 'package:stopliteapp/screens/home/stoplite_tile.dart';

class StopliteList extends StatefulWidget {
  @override
  _StopliteListState createState() => _StopliteListState();
}

class _StopliteListState extends State<StopliteList> {
  @override
  Widget build(BuildContext context) {
    final stoplites = Provider.of<List<Stoplite>>(context);

    return ListView.builder(
      itemCount: stoplites.length,
      itemBuilder: (context, index) {
        return StopliteTile(stoplite: stoplites[index]);
      },
    );
  }
}
