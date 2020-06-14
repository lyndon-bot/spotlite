import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stopliteapp/models/stoplite.dart';

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

  //stoplite list from snapshot
  List<Stoplite> _stopliteListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc){
      return Stoplite(
        name: doc.data['name'] ?? '',
        strength: doc.data['strength'] ?? 0,
        sugars: doc.data['sugars'] ?? '0'
      );
    }).toList();
  }
  // get stoplite stream

  Stream<List<Stoplite>> get Stoplites {
    return StopLiteCollection.snapshots()
    .map(_stopliteListFromSnapshot);
  }
}
