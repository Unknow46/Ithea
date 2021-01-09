import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/data/dataSources/firestoreDataSources/firestore.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/card_article_selected.dart';
import 'package:ithea/widgets/navigation_drawer.dart';
import 'package:ithea/widgets/text_style.dart';


class Basket extends StatefulWidget {

  const Basket({Key key}):super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  dynamic basketList;
  final user =  FirebaseAuth.instance.currentUser;

  @override
  // ignore: avoid_void_async
  void initState() {
    super.initState();
    getBasket();
  }

  Future<void> getBasket() async {
    setState(() {
      basketList = Firestore.instance.getBasketDocument(user.uid);
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
                        children: basketList.map(
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
