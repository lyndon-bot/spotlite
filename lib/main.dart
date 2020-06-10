import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stopliteapp/services/auth.dart';
import 'package:stopliteapp/splash_screen.dart';
import 'package:stopliteapp/screens/wrapper.dart';
import 'package:stopliteapp/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Wrapper(),
        //home: SplashScreen(),
      ),
    );
  }
}
