import 'package:flutter/material.dart';
import 'package:stopliteapp/screens/authenticate/login.dart';
import 'package:stopliteapp/screens/authenticate/sign_up.dart';

class Authenticate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or auth
    return Login();
  }
}
