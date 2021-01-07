import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ithea/data/entities/client.dart';

class Firestore {
  FirebaseFirestore firestore;
  // ignore: sort_constructors_first
  Firestore._privateConstructor(){
    firestore ??= FirebaseFirestore.instance;
  }
  static final Firestore _instance = Firestore._privateConstructor();
  static Firestore get instance => _instance;

  Future<void> insertUserDocument(Client client, String uid) async {
    final users = FirebaseFirestore.instance.collection('Users');
    await users.doc(uid).set(client.toJson());
    return;
  }

  Future<void> getUserDocument(String userID) async {
    final users = FirebaseFirestore.instance.collection('Users');
    return users.doc(userID).get();
  }

  Future<void> getArticles(String userID) async {
    final users = FirebaseFirestore.instance.collection('Users');
    return users.doc(userID).get();
  }

}