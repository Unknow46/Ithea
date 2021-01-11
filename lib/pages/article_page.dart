import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';

import 'article_details_page.dart';

CollectionReference articles =
    FirebaseFirestore.instance.collection('articles');

class ArticlePage extends StatefulWidget {
  const ArticlePage({Key key})
      : super(key: key);
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  List<dynamic> articlesList = [];
  dynamic user;

  @override
  void initState() {
    getArticles();
    getUser();
    super.initState();
  }

  // ignore: inference_failure_on_function_return_type, always_declare_return_types
  getArticles() async {
    final snapshot = await articles.get();
    setState(() {
      articlesList = snapshot.docs;
    });
  }

  Future<dynamic> getUser() async {
    setState(() {
      user =  FirebaseAuth.instance.currentUser;
    });
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarIthea('Boutique'),
      body: ListView(
        padding: const EdgeInsets.only(left: 20),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
                /**/
              children: articlesList.map(
                (article) => _buildCard(article.id, article['name'], article['price'].toString(),article['image'], false, context, false)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String id, String name, String price, String imgpath, bool isFavourite,
      dynamic buildContext, bool added) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {
          Navigator.of(buildContext).push(MaterialPageRoute<dynamic>(
              builder: (context) => ArticleDetail(
                    id:id,
                    assetPath: imgpath,
                    teaprice: price,
                    teaname: name,
                    uid: user.uid,
                  )));
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 5,
              )
            ],
            color: Colors.white,
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (isFavourite)
                    const Icon(Icons.favorite, color: Colors.red)
                  else
                    const Icon(Icons.favorite, color: Colors.red)
                ],
              ),
            ),
            Hero(
              tag: imgpath,
              child: Container(
                height: 75,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: MemoryImage(base64.decode(imgpath)),
                )),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              price,
              style: const TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'Varela',
                fontSize: 14,
              ),
            ),
            Text(
              name,
              style: const TextStyle(
                color: Colors.black45,
                fontFamily: 'Varela',
                fontSize: 14,
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8),
                child: Container(color: const Color(0xFFEBEBEB), height: 1)),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (!added) ...[
                    const Icon(Icons.shopping_basket,
                        color: Colors.greenAccent, size: 12),
                    const Text('Add to cart',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.greenAccent,
                            fontSize: 12))
                  ],
                  if (added) ...[
                    const Icon(Icons.remove_circle_outline,
                        color: Colors.greenAccent, size: 12),
                    const Text('3',
                        style: TextStyle(
                            fontFamily: 'Varela',
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    const Icon(Icons.add_circle_outline,
                        color: Colors.greenAccent, size: 12),
                  ],
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
