import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:stopliteapp/widgets/provider_widget.dart';
import 'package:stopliteapp/screens/home/home_widget.dart';
import 'package:stopliteapp/services/auth.dart';

class ProfileView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile hey carlos"),
        ),
        body: Center(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: <Widget>[
                    //Text('thisisacolm'),
                    FutureBuilder(
                        future: FirebaseAuth.instance.currentUser(),
                        builder:
                            (context, AsyncSnapshot<FirebaseUser> snapshot) {
//        future: Provider.of(context).auth.getCurrentUID(),
//            builder:(context, snapshot){
                          if (snapshot.hasData) {
                            return QrImage(
                              data: snapshot.data.uid,
                              version: QrVersions.auto,
                              embeddedImage:
                                  AssetImage('assets/images/logo.png'),
                              size: 200.0,
                            );
                            Text('Userid  ' + snapshot.data.uid);
                          } else {
                            return Text('loading user');
                          }
//            if(snapshot.connectionState == ConnectionState.done){
//              return Text("snapshot.data");
//            }
                        })

//////////////
                  ],
                ),
                /* Column(children: [
                 // RaisedButton(onPressed: () {
                    Navigator.pop(context);
                  }),
                ]),*/
              ],
            ),
          ),
        ));
  }
}
