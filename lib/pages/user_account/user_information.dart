import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ithea/animation/animation_transition.dart';

import 'account_main_page.dart';

class UserInformation extends StatefulWidget {

  const UserInformation({Key key}) : super(key: key);

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {

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
    final user =  FirebaseAuth.instance.currentUser;
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text('Nom'),
                                        const Padding(padding: EdgeInsets.only(top:10)),
                                        Text(user.displayName),
                                        const Padding(padding: EdgeInsets.only(bottom:15)),
                                      ],
                                    )
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:  <Widget>[
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        const Text('Email'),
                                        const Padding(padding: EdgeInsets.only(top:10)),
                                        Text(user.email),
                                        const Padding(padding: EdgeInsets.only(bottom:15)),
                                      ],
                                    )
                                  ],
                                )
                            ),
                          ],
                        ),
                      ),
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


