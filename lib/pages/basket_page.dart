import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/data/dataSources/firestoreDataSources/firestore.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/card_article_selected.dart';
import 'package:ithea/widgets/navigation_drawer.dart';
import 'package:ithea/widgets/text_style.dart';


CollectionReference panier =
FirebaseFirestore.instance.collection('panier');

CollectionReference articles =
FirebaseFirestore.instance.collection('articles');

class Basket extends StatefulWidget {

  const Basket({Key key}):super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  Future<List<String>> basketList;
  List<dynamic> articleList = [];
  final user =  FirebaseAuth.instance.currentUser;

  @override
  // ignore: avoid_void_async
  void initState() {
    super.initState();
    basketList = getBasket();
    getArticles(basketList);
  }

  Future<List<String>> getBasket() async {
    var currentBasket = <String>[];
    await panier.doc(user.uid).get().then((doc) {
      currentBasket= List<String>.from(doc['list_article']);
    });
    return currentBasket;
  }

   // ignore: inference_failure_on_function_return_type, always_declare_return_types
   getArticles(Future<List<String>> basketList) async {
    await basketList.then((list) {
      list.forEach((element) async {
        final snapshot = await articles.doc(element).get();
        setState(() {
          articleList.add(snapshot);
        });
      });
    });
  }


  @override
   Widget build(BuildContext context) {
    return  Scaffold(
          appBar:  const AppBarIthea('Panier'),
          drawer:  const NavigationDrawer(),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
                      ListView(
                        children: articleList.map(
                                (article) {
                                CardArticle(article['name'], article['price'].toString(),'100','1',article['image']);
                                const Divider();
                                }).toList(),
                      ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Divider(),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                            FlatButton(
                            //minWidth: 169,
                            //height: 45,
                            disabledColor: Colors.green,
                            onPressed: validateBasket,
                            child: const CustomTextStyle('Valider le panier', FontWeight.normal, 18, colors: Colors.white,)
                          ),
                          Column(
                            children: const <Widget>[
                              CustomTextStyle('Total:', FontWeight.normal, 18),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              CustomTextStyle('28,00€', FontWeight.normal, 16),
                            ],
                          )
                        ],
                      ),
                    const Padding(padding: EdgeInsets.only(bottom: 40))
                    ],
                  )
            ],
          )
    );
  }


  void validateBasket() {
  }

}

