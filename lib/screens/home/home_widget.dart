import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'dart:async';

import 'package:stopliteapp/services/auth.dart';

class HomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unkown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You Pressed the back button before anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unkown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              // onPressed: () {
              //  _select(choices[0]);
              // },
            ),
            CircleAvatar(
              backgroundColor: Colors.brown.shade800,
              child: Text('AH'),
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              color: Colors.grey,
              onPressed: () async {
                await _auth.signOut();
              },
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        //currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.insert_chart),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_cart),
            title: new Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.help_outline),
            title: new Text('Profile'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.notification_important),
            title: new Text('Messages'),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}