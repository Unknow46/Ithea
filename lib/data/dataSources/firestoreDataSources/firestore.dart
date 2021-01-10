import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ithea/data/entities/article.dart';
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
  
  Future<void> getArticleDocument(String articleID) async {
    final article = FirebaseFirestore.instance.collection('articles');
    return article.doc(articleID).get();
  }

  Future<void> insertBasketDocument(Article article, String uid) async {
    final basket = FirebaseFirestore.instance.collection('panier');
    await basket.doc(uid).get().then((doc) {
      if (doc.exists) {
        final currentBasket = List<String>.from(doc['list_article']);
        final currentArticle = article.articleBasket.first;
        currentBasket.add(currentArticle);
        basket.doc(uid).update(<String, dynamic>{
          'list_article': currentBasket
        });
      } else {
        basket.doc(uid).set(article.toJsonBasket());
      }
    });
  }

  Future<void> getBasketDocument(String userId) async {
    final basket = FirebaseFirestore.instance.collection('panier');
    return basket.doc(userId).get();
  }

  Future<void> insertFavoriteDocument(Article article, String uid) async {
    final favorite = FirebaseFirestore.instance.collection('favoris');
    await favorite.doc(uid).get().then((doc) {
      if (doc.exists) {
        final currentFavorite = List<String>.from(doc['list_article']);
        final currentArticle = article.articleFavorite.first;
        currentFavorite.add(currentArticle);
        favorite.doc(uid).update(<String, dynamic>{
          'list_article': currentFavorite
        });
      } else {
        favorite.doc(uid).set(article.toJsonFavorite());
      }
    });
  }

  Future<void> getFavoriteDocument(String userId) async {
    final favoris = FirebaseFirestore.instance.collection('favoris');
    return favoris.doc(userId).get();
  }

}