import 'package:firebase_auth/firebase_auth.dart';
import 'package:stopliteapp/models/user.dart';
import 'package:stopliteapp/services/database.dart';
import 'dart:async';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

////
//test//
  /* void inputData() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    // input the data into firestore???
  }*/

  ////
  //create user object based on fb user

  User _userFromFireBaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }
  // auth change use stream

  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }


  getUID() async {
    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid;
    return  uid;
  }


////////////////////////////
  //more test
  //
  /*Stream<String> get onAuthStateChanged => _auth.onAuthStateChanged.map(
        (FirebaseUser user) => user?.uid,
      );
*/
  /* ///GET User ID
  Future<String> getCurrentUID() async {
    return (await _auth.currentUser()).uid;
  }

// GET CURRENT USER

  Future getCurrentUser() async {
    return await _auth.currentUser();
  }
*/
//
//  Future updateUserName(String name, FirebaseUser currentUser) async{
//    var userUpdateInfo = UserUpdateInfo();
//    userUpdateInfo.displayName = name;
//    await currentUser.updateProfile(userUpdateInfo);
//    await currentUser.reload();
//  }
//

  ///////////////////////

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
      // using firebases current user and converting into our own user
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
  //register with email and password

  Future registerWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      FirebaseUser user = result.user;
      //create a new document for user with the uid
      // passing in username and userid to database
      await DatabaseService(uid: user.uid).updateUserData(username);

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
