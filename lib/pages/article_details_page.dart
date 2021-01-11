import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/data/dataSources/firestoreDataSources/firestore.dart';
import 'package:ithea/data/entities/article.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';

// ignore: must_be_immutable
class ArticleDetail extends StatelessWidget {
  ArticleDetail({Key key, this.id, this.assetPath, this.teaprice, this.teaname, this.uid})
      : super(key: key);

  Firestore firestore = Firestore.instance;
  final String assetPath, teaprice, teaname, id, uid;
  Article article = Article('Green tea', 20.5, 'Logo.png', false);

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
              GestureDetector(
                onTap: () async {
                  await article.addFavorite(id);
                 await addingFavorite();
                },
                child: const Icon(CupertinoIcons.heart),
              )
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
            onTap: () async{
              await article.addArticle(id);
              await addingBasket();
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50,
              decoration: const BoxDecoration(color: Colors.green),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.shopping_basket,
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

  Future<void> addingFavorite() async {
    await Firestore.instance.insertFavoriteDocument(article, uid);
  }

  Future<void> addingBasket() async {
    await Firestore.instance.insertBasketDocument(article, uid);
  }

}

