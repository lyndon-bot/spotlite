import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:stopliteapp/services/auth.dart';
import 'package:stopliteapp/shared/loading.dart';

class Login extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Function toggleView;
  Login({this.toggleView});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String error = '';

  //Text field State
  String email = '';
  String password = '';

  TextStyle style = TextStyle(fontFamily: 'Ubuntu', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      validator: (val) => val.isEmpty ? 'Enter an email' : null,
      onChanged: (val) {
        setState(() => email = val);
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextFormField(
      validator: (val) =>
          val.length < 6 ? 'Enter a password 6+ chars long' : null,
      onChanged: (val) {
        setState(() => password = val);
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          if (_formKey.currentState.validate()) {
            setState(() {
              loading = true;
            });
            dynamic result =
                await _auth.signInWithEmailAndPassword(email, password);
            //print("user logged in UID is ${result.uid}");
            if (result == null) {
              setState(() {
                error = 'Could not sign in with those credentials';
                loading = false;
              });
            }
          }
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return loading
        ? Loading()
        : Scaffold(
            body: Form(
              key: _formKey,
              child: Center(
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 155.0,
                          child: Image.asset(
                            "assets/images/logo.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                        SizedBox(height: 45.0),
                        emailField,
                        SizedBox(height: 25.0),
                        passwordField,
                        SizedBox(
                          height: 35.0,
                        ),
                        loginButon,
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Don\'t have an account?',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 18),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Sign up',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 18),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              widget.toggleView();
                                            })
                                    ]),
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
