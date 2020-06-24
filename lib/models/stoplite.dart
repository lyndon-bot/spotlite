import 'package:cloud_firestore/cloud_firestore.dart';

class Stoplite {
  final Timestamp createdOn;
  final String user2;
  final int status;

  Stoplite({this.createdOn, this.user2, this.status});
}
