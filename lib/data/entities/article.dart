import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import '../../globals.dart';

class Article {
  Article(this.name, this.price, this.image, this.isFavourite);


   String name;
   double price;
   String image;
   dynamic isFavourite;

  CollectionReference articles = FirebaseFirestore.instance.collection('articles');

  Future<String> imageToString() async {
    final bytes = await rootBundle.load('assets/images/teaPic.png');
    final buffer = bytes.buffer;
    final image = base64.encode(Uint8List.view(buffer));
    return image;
  }
  List<String> articleBasket = [];
  List<String> articleFavorite = [];

  Future<void> addArticle(String id) async {
    articleBasket.add(id);
  }

  Future<void> removeArticle(String id) async {
    articleBasket.remove(id);
  }

  Future<void> addFavorite(String id) async {
    if (!articleFavorite.contains(id)){
      articleFavorite.add(id);
    }
  }

  Future<void> removeFavorite(String id) async {
    articleFavorite.remove(id);
  }


  // ignore: sort_constructors_first
  Article.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
    isFavourite = json['isFavourite'];
  }


  Map<String, dynamic> toJsonBasket(){
    final data = <String, dynamic>{};
    data['uid'] = client.uid;
    data['list_article'] = articleBasket;
    return data;
  }

  Map<String, dynamic> toJsonFavorite(){
    final data = <String, dynamic>{};
    data['uid'] = client.uid;
    data['list_article'] = articleBasket;
    return data;
  }

}