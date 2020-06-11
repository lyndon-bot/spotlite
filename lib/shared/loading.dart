import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(left: 120, top: 340, right: 120),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //Image.asset('assets/images/logo.png', height: 100, width: 320),
          SpinKitChasingDots(
            color: Color(0xffacbf65),
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
