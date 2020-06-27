import 'package:cloud_firestore/cloud_firestore.dart';

class Stoplite {
  final Timestamp createdOn;
  final String user1;
  final int status;
  final String username;
  final String id;

  Stoplite({this.createdOn, this.user1, this.status, this.username, this.id});
}
