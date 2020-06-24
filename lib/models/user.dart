class User {
  final String uid;

  User({this.uid});

  String getUser() {
    return this.uid;
  }
}

class UserData {
  final String uid;
  final String qrid;

  UserData({this.uid, this.qrid});
}
