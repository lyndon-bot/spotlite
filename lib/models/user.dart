class User {
  final String uid;
  final String fullname;
  final String email;


  User({this.uid, this.fullname, this.email});

  User.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        fullname = data['fullname'],
        email = data['email'];

  Map<String, dynamic> toJson(){
    return{
      'uid':uid,
      'fullname': fullname,
      'email':email,
    };
  }

}