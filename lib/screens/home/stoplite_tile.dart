import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:stopliteapp/models/stoplite.dart';
import 'package:stopliteapp/services/database.dart';

class StopliteTile extends StatelessWidget {
  final Stoplite stoplite;
  StopliteTile({this.stoplite});

  @override
  Widget build(BuildContext context) {
    //User userData = Provider.of<UserData>(context);

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
          margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.grey,
            ),
            title: Text('${stoplite.id}'),
            //subtitle: Text('Takes ${stoplite.user2} sugar(s)'),
            trailing: Column(children: <Widget>[
              Container(
                margin: EdgeInsets.all(5.0),
                height: 20,
                child: MaterialButton(
                  color: Colors.red,
                  height: 30,
                  onPressed: () {
                    Firestore.instance
                        .collection('interactions')
                        .document(stoplite.id)
                        .updateData({'status': '-1'});
                  },
                  child: Text(
                    "Deny",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                height: 20,
                child: MaterialButton(
                  color: Colors.green,
                  height: 30,
                  onPressed: () {
                    Firestore.instance
                        .collection('interactions')
                        .document(stoplite.id)
                        .updateData({'status': '1'});
                  },
                  child: Text(
                    "Accept",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
