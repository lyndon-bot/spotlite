import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/models/user.dart';
import 'package:stopliteapp/screens/home/home_widget.dart';
import 'package:stopliteapp/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    //final userData = Provider.of<UserData>(context);

    // return either the Home or Authenticate widget
    if (user == null) {
      print("user not logged in");
      return Authenticate();
    } else {
      print("Wrapper user is ${user.uid}");
      return HomePage();
    }
  }
}
