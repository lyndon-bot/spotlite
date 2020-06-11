import 'package:firebase_auth/firebase_auth.dart';
import 'package:stopliteapp/models/user.dart';
import 'package:stopliteapp/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on fb user

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change use stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  //register with email and password

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;

      //create a new document for user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new member', 100);
      return _userFromFireBaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
