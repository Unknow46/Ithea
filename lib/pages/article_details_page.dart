import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';

class ArticleDetail extends StatelessWidget {
  ArticleDetail({Key key, this.assetPath, this.teaprice, this.teaname})
      : super(key: key);

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Article article = Article('Green tea', 20.5, 'Logo.png', false);

  final String assetPath, teaprice, teaname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIthea('Article'),
      body: ListView(children: [
        const SizedBox(height: 45),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
            child: Text(
              teaname,
              style: GoogleFonts.getFont('Vidaloka',
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 85),
        Hero(
            tag: assetPath,
            child: Image.memory(base64.decode(assetPath),
                height: 150, width: 100, fit: BoxFit.contain)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: <Widget>[
              Center(
                child: Text(teaprice,
                    style: GoogleFonts.getFont('Vidaloka',
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 170),
                child: Icon(Icons.share),
              ),
              const Icon(CupertinoIcons.heart),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
              'Description',
              style: GoogleFonts.getFont(
                'Vidaloka',
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget sodales diam velit dapibus viverra.',
                style: GoogleFonts.getFont('Vidaloka',
                    color: const Color(0xFFB4B8B9))),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: InkWell(
            onTap: () => article.addArticle(),
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50,
              decoration: const BoxDecoration(color: Colors.green),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Text(
                  'Add to cart',
                  style: GoogleFonts.getFont('Vidaloka',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class Article {
  Article(this.name, this.price, this.image, this.isFavourite);

  final String name;
  final double price;
  final String image;
  final bool isFavourite;

  CollectionReference articles = FirebaseFirestore.instance.collection('articles');

  Future<String> imageToString() async {
    ByteData bytes = await rootBundle.load('assets/images/teaPic.png');
    var buffer = bytes.buffer;
    String image = base64.encode(Uint8List.view(buffer));
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
        .then((value) => print('Article Added'))
        .catchError((error) => print('failed to add Article: $error'));
  }



}
