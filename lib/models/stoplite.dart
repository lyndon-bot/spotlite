import 'package:cloud_firestore/cloud_firestore.dart';

class Stoplite {
  final Timestamp createdOn;
  final String user1;
  final int status;
  final String username;

  Stoplite({this.createdOn, this.user1, this.status, this.username});
}
