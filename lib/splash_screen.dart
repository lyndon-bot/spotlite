import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';
import 'package:stopliteapp/home_widget.dart';
import 'package:stopliteapp/user_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /* @override
  void initState() {
    super.initState();

    _mockCheckForSession().then((status) {
      if (status) {
        _navigateToHome();
      } else {
        _navigateToLogin();
      }
    });
  }

  Future<bool> _mockCheckForSession() async {
    await Future.delayed(Duration(milliseconds: 6000), () {});

    return true;
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => HomePage()));
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => UserWidget()));
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Opacity(
                opacity: 1,
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 100,
                )),
            Shimmer.fromColors(
              period: Duration(milliseconds: 1500),
              baseColor: Color(0xff7f00ff),
              highlightColor: Color(0xffe100ff),
              child: Container(
                  padding: EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "Loading...",
                      style: TextStyle(
                          fontSize: 25.0,
                          fontFamily: 'Ubuntu',
                          shadows: <Shadow>[
                            Shadow(
                                blurRadius: 18.0,
                                color: Colors.black87,
                                offset: Offset.fromDirection(120, 12))
                          ]),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/
