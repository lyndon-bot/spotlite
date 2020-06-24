import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
//import 'file:///C:/Users/lyndon%20bowen/AndroidStudioProjects/stopliteapp/lib/screens/authenticate/login.dart';
import '..//authenticate/login.dart';
//import 'file:///C:/Users/lyndon%20bowen/AndroidStudioProjects/stopliteapp/lib/screens/home/home_widget.dart';
import '../home/home_widget.dart'; // relative import?
import 'package:stopliteapp/services/auth.dart';
import 'package:stopliteapp/shared/loading.dart';

class SignUpPage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final Function toggleView;
  SignUpPage({this.toggleView});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String username = '';
  String email = '';
  String password = '';
  String cpassword = '';
  String error = '';

  TextStyle style = TextStyle(fontFamily: 'Ubuntu', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final usernameField = TextFormField(
      validator: (val) => val.isEmpty ? 'enter an username' : null,
      onChanged: (val) {
        setState(() => username = val);
      },
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final emailField = TextFormField(
      validator: (val) => val.isEmpty ? 'enter an email' : null,
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
          val.length < 6 ? 'enter a password 6+ chars long' : null,
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
    final cPasswordField = TextFormField(
      onChanged: (val) {
        setState(() => cpassword = val);
      },
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Confirm Password",
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
            print(password);
            dynamic result = await _auth.registerWithEmailAndPassword(
                email, password, username);
            print(result);
            if (result == null) {
              setState(() {
                error = 'please supply a valid email';
                loading = false;
              });
            }
          }
        },
        child: Text("Sign Up",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return loading
        ? Loading()
        : Scaffold(
            body: Container(
              child: Form(
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
                          SizedBox(height: 25.0),
                          usernameField,
                          SizedBox(height: 25.0),
                          emailField,
                          SizedBox(height: 25.0),
                          passwordField,
                          SizedBox(height: 25.0),
                          //cPasswordField,
                          SizedBox(
                            height: 30.0,
                          ),
                          loginButon,
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          ),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Center(
                                child: RichText(
                                  text: TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' Login ',
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
            ),
          );
  }
}
