class User {
  final String uid;

  User({this.uid});

  String getUser() {
    return uid;
  }
}

class UserData {
  final String uid;
  final String qrid;
  final String username;

  UserData({this.uid, this.qrid, this.username});
}
