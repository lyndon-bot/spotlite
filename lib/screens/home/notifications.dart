import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/models/stoplite.dart';
import 'package:stopliteapp/models/user.dart';
import 'package:stopliteapp/screens/home/stoplite_list.dart';
import 'package:stopliteapp/services/database.dart';
import 'package:stopliteapp/shared/loading.dart';

// ignore: camel_case_types
class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

// ignore: camel_case_types
class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Form(
      child: StreamProvider<List<Stoplite>>.value(
        value: DatabaseService(uid: user.uid).stoplites,
        child: Scaffold(
          body: Center(
            child: StopliteList(),
          ),
        ),
      ),
    );
  }
}
