import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ithea/animation/animation_transition.dart';
import 'package:ithea/user_account/account_main_page.dart';

class HistoricUser extends StatefulWidget {

  const HistoricUser({Key key }) : super(key: key);


  @override
  _HistoricUserState createState() => _HistoricUserState();
}

class _HistoricUserState extends State<HistoricUser> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        child: Stack(
          children: <Widget>[
            userHistoric(context),
            GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity > 0) {
                    //swipe left
                    Navigator.pop(
                      context,
                      SlideLeftRoute(page: const Compte()),
                    );
                  }
                }
            )
          ],
        ),
      );
    });
  }

  Scaffold userHistoric(BuildContext context) {
    return Scaffold(
      body: ListView(
          children: <Widget>[
      Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
      Padding(
      padding: const EdgeInsets.only(top: 25),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const <Widget>[
          Text(
            'Informations', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          ),
          Text(
            'Cartes', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
          ),
          ),
          Text(
            'Commandes', style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              fontSize: 18
          ),
          ),
        ],
      ),
    ),
    ],
    ),
    ],
    )
    );
  }
}


