import 'package:flutter/material.dart';
import 'package:ithea/animation/animation_transition.dart';

import 'account_main_page.dart';

class UserInformation extends StatefulWidget {

  const UserInformation({Key key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  var _nomEnable = false;
  var _prenomEnable = false;
  var _emailEnable = false;
  var _adresseEnable = false;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Material(
        child: Stack(
          children: <Widget>[
            userInformation(context),
            GestureDetector(
                onHorizontalDragEnd: (DragEndDetails details) {
                  if (details.primaryVelocity < 0) {
                    //swipe left
                    Navigator.pop(
                      context,
                      SlideRightRoute(page: const Compte()),
                    );
                  }
                }
            )
          ],
        ),

      );
    });
  }

  Scaffold userInformation(BuildContext context) {

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
                        decoration: TextDecoration.underline,
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
                        fontSize: 18
                    ),
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.only(top:30, left: 10, right: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        elevation: 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:   <Widget>[
                            Padding(padding:  const EdgeInsets.only(top:5),
                                child:
                                Row(
                                  children:  <Widget>[
                                    Flexible(child: TextField(
                                      decoration:  const InputDecoration(labelText: 'Nom', helperText: 'Entrer votre nom'),
                                      enabled: _nomEnable,
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 10, top:20),
                                      child:  IconButton(icon: const Icon(Icons.edit),
                                          alignment: Alignment.bottomRight,
                                          iconSize: 15,
                                          onPressed: () {
                                              setState(() {
                                                if (_nomEnable){
                                                  _nomEnable = false;
                                                } else {
                                                  _nomEnable = true;
                                                }
                                              });
                                          }
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:   <Widget>[
                            Padding(padding:  const EdgeInsets.only(top:5),
                                child:
                                Row(
                                  children:  <Widget>[
                                    Flexible(child: TextField(
                                      decoration:  const InputDecoration(labelText: 'Prénom', helperText: 'Entrer votre prénom'),
                                      enabled: _prenomEnable,
                                    ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 10, top:20),
                                      child:  IconButton(icon: const Icon(Icons.edit),
                                          alignment: Alignment.bottomRight,
                                          iconSize: 15,
                                          onPressed: () {
                                            setState(() {
                                              if (_prenomEnable){
                                                _prenomEnable = false;
                                              } else {
                                                _prenomEnable = true;
                                              }
                                            });
                                          }
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:   <Widget>[
                            Padding(padding:  const EdgeInsets.only(top:5),
                                child:
                                Row(
                                  children:  <Widget>[
                                    Flexible(child: TextField(
                                      decoration:  const InputDecoration(labelText: 'Email', helperText: 'Entrer votre email'),
                                      enabled: _emailEnable,
                                      ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 10, top:20),
                                      child:  IconButton(icon: const Icon(Icons.edit),
                                          alignment: Alignment.bottomRight,
                                          iconSize: 15,
                                          onPressed: () {
                                            setState(() {
                                              if (_emailEnable){
                                                _emailEnable = false;
                                              } else {
                                                _emailEnable = true;
                                              }
                                            });
                                          }
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
                      Card(
                        elevation: 0.25,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:   <Widget>[
                            Padding(padding:  const EdgeInsets.only(top:5),
                                child:
                                Row(
                                  children:  <Widget>[
                                    Flexible(child: TextField(
                                      decoration:  InputDecoration(labelText: 'Adresse de livraison', helperText: 'Entrer votre adresse'),
                                      enabled: _adresseEnable,
                                    ),
                                    ),
                                    Padding(padding: const EdgeInsets.only(left: 10, top:20),
                                      child:  IconButton(icon: const Icon(Icons.edit),
                                          alignment: Alignment.bottomRight,
                                          iconSize: 15,
                                          onPressed: () {
                                            setState(() {
                                              if (_emailEnable){
                                                _emailEnable = false;
                                              } else {
                                                _emailEnable = true;
                                              }
                                            });
                                          }
                                      ),
                                    ),
                                  ],
                                )
                            ),
                          ],
                        ),
                      )
                      ]
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}


