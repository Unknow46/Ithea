
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/card_article_selected.dart';
import 'package:ithea/widgets/navigation_drawer.dart';

class Favorite extends StatefulWidget {

const Favorite({Key key}):super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  const AppBarIthea('Favoris'),
      drawer:  const NavigationDrawer(),
      body: Stack(
          children: <Widget>[
      Column(
      children: const <Widget>[
          CardArticle('AquaSummer', '4.00€',  '100', '1', 'assets/images/AquaSummer.png', icon: 'assets/images/panier_cercle.png'),
      Divider(),
      ],
      ),
    ]
    ),
    );
  }
}
