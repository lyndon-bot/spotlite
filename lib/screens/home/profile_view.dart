import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stopliteapp/widgets/provider_widget.dart';
import 'package:stopliteapp/screens/home/home_widget.dart';
import 'package:stopliteapp/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileView extends StatelessWidget{
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Profile Page'),
      ),
          body: StreamBuilder(
        stream:Firestore.instance.collection('Stoplites').snapshots(),
            builder:(context,snapshot){
          if(!snapshot.hasData) return Text('Loading data..');
            return Column(

              children: <Widget>[


              Text('username: ' + snapshot.data.documents[0]['name'],style: new TextStyle(fontSize: 15.0), textAlign: TextAlign.center),
              Text('strength: ' + snapshot.data.documents[0]['strength'].toString(), style: new TextStyle(fontSize: 15.0), textAlign: TextAlign.center),
              FutureBuilder(
            future: FirebaseAuth.instance.currentUser(),
              builder: (context, AsyncSnapshot<FirebaseUser> snapshot){
                if(snapshot.hasData){
                  return Text('Userid:  ' + snapshot.data.uid, style: new TextStyle(fontSize: 15.0),textAlign: TextAlign.center);
                }
                else{
                  return Text ('loading user', style: new TextStyle(fontSize: 15.0),textAlign: TextAlign.center);
                }
              }

              )
            ],
          );

            },

    )



    );
  }
}
