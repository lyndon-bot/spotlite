import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/models/user.dart';

class ProfileView extends StatelessWidget {
  final dbRef = Firestore.instance.collection('user');


  Widget build(BuildContext context) {
    Stream<DocumentSnapshot> provideDocumentINFO() {
      User user1 = Provider.of<User>(context);
      return Firestore.instance
          .collection('user')
          .document(user1.uid)
          .snapshots();
    }

    return new Scaffold(
        appBar: new AppBar(
        title: new Text('Profile Page'),
    ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: provideDocumentINFO(),
          builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasData) {
              //snapshot -> AsyncSnapshot of DocumentSnapshot
              //snapshot.data -> DocumentSnapshot
              //snapshot.data.data -> Map of fields that you need

              Map<String, dynamic> documentFields = snapshot.data.data;
              //TODO Okay, now you can use documentFields (json) as needed

              return Column(
                children: <Widget>[
              Text("QRID:  " + documentFields['qrid']),
              Text("Username :" + documentFields['username']),
              Text("Uid again but from query   " + documentFields['uid']),
              FutureBuilder(
                  future: FirebaseAuth.instance.currentUser(),
                  builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
                    if (snapshot.hasData){
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
                    }
                    else {
                      return Text('loading user',
                          style: new TextStyle(fontSize: 15.0),
                          textAlign: TextAlign.center);
                    }
                  }
              )
                ],
              );


            }
          },
      ),

    );

  }
  }



