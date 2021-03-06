import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stopliteapp/models/stoplite.dart';
import 'package:stopliteapp/models/user.dart';

class DatabaseService {
  //collection reference
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference stopLiteCollection =
      Firestore.instance.collection('user');

  final CollectionReference stopLiteCollection2 =
      Firestore.instance.collection('interactions');

  // updating user database where the user gets the uid, qrid
  Future updateUserData(String username) async {
    print(username);
    return await stopLiteCollection.document(uid).setData({
      'uid': uid,
      'qrid': uid,
      'username': username,
    });
  }

  String uid2;
  Future getUserData(user2) async {
    print("Get_user_data Recives data $user2");
    return await stopLiteCollection
        .where("qrid", isEqualTo: user2)
        .getDocuments()
        .then((value) {
      value.documents.forEach((result) {
        uid2 = result.data['qrid'];
      });
      createInteraction(uid2);
    });
  }

  Future createInteraction(user2) async {
    print('test stuff $uid');
    print('user scanned $user2');
    return await stopLiteCollection2.document().setData({
      'status': 0,
      'user1': "/user/$uid",
      'user2': "/user/$user2",
      'createdOn': FieldValue.serverTimestamp(),
    });
  }

// user data from snapshots
  // takes snapshot and creates a specific data
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      qrid: snapshot.data['qrid'],
      username: snapshot.data['username'],
    );
  }

  //stoplite list from snapshot
  List<Stoplite> _stopliteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Stoplite(
          createdOn: doc.data['createdOn'] ?? '',
          status: doc.data['status'] ?? 0,
          user1: doc.data['user1'] ?? '0',
          id: doc.documentID ?? '0');
    }).toList();
  }
  // get stoplite stream

  Stream<List<Stoplite>> get stoplites {
    print(uid);

    return stopLiteCollection2
        .where("status", isEqualTo: 0)
        .where("user2", isEqualTo: "/user/$uid")
        .snapshots()
        .map(_stopliteListFromSnapshot);
  }

  // get user doc stream
  // creating a stream to the userclass
  Stream<UserData> get userData {
    return stopLiteCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }

  Stream<UserData> get userData2 {
    return stopLiteCollection2
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
