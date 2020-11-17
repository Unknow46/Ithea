class User {
  User(
      String displayName,
      String email,
      dynamic  emailVerified,
      String photoURL,
      String uid){
    this.displayName = displayName;
    this.email = email;
    this.emailVerified = emailVerified;
    this.photoURL = photoURL;
    this.uid= uid;
  }

  String displayName;
  String email;
  bool emailVerified;
  String photoURL;
  String uid;

  User.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    photoURL = json['photoURL'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['emailVerified'] = this.emailVerified;
    data['photoURL'] = this.photoURL;
    data['uid'] = this.uid;
    return data;
  }
}