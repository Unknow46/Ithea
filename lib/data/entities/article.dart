import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class Article {
  // ignore: avoid_positional_boolean_parameters
  Article(this.name, this.price, this.image, this.isFavourite);

  final String name;
  final double price;
  final String image;
  final bool isFavourite;

  CollectionReference articles = FirebaseFirestore.instance.collection('articles');

  Future<String> imageToString() async {
    final bytes = await rootBundle.load('assets/images/teaPic.png');
    final buffer = bytes.buffer;
    final image = base64.encode(Uint8List.view(buffer));
    return image;
  }

  Future<void> addArticle() async {
    return articles
        .add({
      'name': name,
      'price': price,
      'image': await imageToString(),
      'isFavourite': isFavourite,
    })
    /*.then((value) => print('Article Added'))
        .catchError((dynamic error) => print('failed to add Article: $error'))*/;
  }
}