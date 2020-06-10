import 'package:firebase_auth/firebase_auth.dart';
import 'package:stopliteapp/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on fb user

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change use stream

  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFireBaseUser(user));
  }
  // sign in anon

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in with email and password

  //register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
