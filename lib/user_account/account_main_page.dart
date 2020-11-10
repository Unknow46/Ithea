import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ithea/animation/animation_transition.dart';
import 'package:ithea/user_account/historic_user.dart';
import 'package:ithea/user_account/user_information.dart';

class Compte extends StatefulWidget {
  const Compte({Key key }) : super(key: key);

  @override
  _CompteState createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override
  Widget build(BuildContext context) {
      return Material(
        child:
            userDisplay(context),
      );
    }
  }

Scaffold userDisplay(BuildContext context) {

  return Scaffold(
    body: ListView(
      children: <Widget>[
        Column(
            children: <Widget>[
               const Align(
                alignment: Alignment.topLeft,
                child:  Text('Compte', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28
                    ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 40),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.supervised_user_circle,
                    size: 90,
                  ),
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top:10),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Nathan Sens', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                      ),
                    ),
                  )
              ),
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
                        decoration: TextDecoration.underline,
                        fontSize: 18
                    ),
                    ),
                    Text(
                      'Commandes', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                    ),
                    ),
                  ],
                ),
              )
            ],
          ),
        GestureDetector(
          onHorizontalDragEnd: (DragEndDetails details){
            if (details.primaryVelocity > 0) {
              //swipe left
              Navigator.push(
                context,
                SlideLeftRoute(page:const UserInformation()),
              );
            } else if(details.primaryVelocity < 0) {
              // swipe right
              Navigator.push(
                context,
                SlideRightRoute(page:const HistoricUser()),
              );
            }
          },
        )
      ],
    ),
  );

}