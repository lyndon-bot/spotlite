import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileView extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Profile Page'),
        ),
        body: StreamBuilder(
          stream: Firestore.instance.collection('Stoplites').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Text('Loading data..');
            return Column(
              children: <Widget>[
                /*Text('username: ' + snapshot.data.documents[0]['name'],
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.center),
                Text(
                    'strength: ' +
                        snapshot.data.documents[0]['strength'].toString(),
                    style: new TextStyle(fontSize: 15.0),
                    textAlign: TextAlign.center), */
                FutureBuilder(
                    future: FirebaseAuth.instance.currentUser(),
                    builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: <Widget>[
                            Text('Userid:  ' + snapshot.data.uid,
                                style: new TextStyle(fontSize: 15.0),
                                textAlign: TextAlign.center),
                            QrImage(
                              data: snapshot.data.uid,
                              version: QrVersions.auto,
                              size: 200.0,
                            ),
                          ],
                        );
                        //Text('Userid:  ' + snapshot.data.uid, style: new TextStyle(fontSize: 15.0),textAlign: TextAlign.center),

                      } else {
                        return Text('loading user',
                            style: new TextStyle(fontSize: 15.0),
                            textAlign: TextAlign.center);
                      }
                    })
              ],
            );
          },
        ));
  }
}
