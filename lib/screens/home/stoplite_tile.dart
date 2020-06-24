import 'package:flutter/material.dart';
import 'package:stopliteapp/models/stoplite.dart';

class StopliteTile extends StatelessWidget {
  final Stoplite stoplite;
  StopliteTile({this.stoplite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            //backgroundColor: Colors.brown[stoplite.strength],
          ),
          title: Text(stoplite.createdOn.toString()),
          subtitle: Text('Takes ${stoplite.user2} sugar(s)'),
        ),
      ),
    );
  }
}
