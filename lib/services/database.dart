import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  //collection reference
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference StopLiteCollection =
      Firestore.instance.collection('Stoplites');

  Future updateUserData(String sugars, String name, int strength) async {
    return await StopLiteCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }

  // get stoplite stream

  Stream<QuerySnapshot> get Stoplites {
    return StopLiteCollection.snapshots();
  }
}
