class Client {

  // ignore: avoid_positional_boolean_parameters
  Client(this.displayName, this.email,this.emailVerified,this.photoURL,this.uid);

  String displayName;
  String email;
  bool emailVerified;
  String photoURL;
  String uid;

  // ignore: sort_constructors_first
  Client.fromJson(Map<String, dynamic> json) {
    displayName = json['displayName'];
    email = json['email'];
    emailVerified = json['emailVerified'];
    photoURL = json['photoURL'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['displayName'] = displayName;
    data['email'] = email;
    data['emailVerified'] = emailVerified;
    data['photoURL'] = photoURL;
    data['uid'] = uid;
    return data;
  }
}