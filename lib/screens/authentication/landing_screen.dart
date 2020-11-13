import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:ithea/screens/authentication/create_account_screen.dart';
import 'package:ithea/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingScreen extends StatefulWidget {

  const LandingScreen({Key key}) : super(key: key);
  @override
  _LandingScreenState createState() => _LandingScreenState();
}


class _LandingScreenState extends State<LandingScreen> {
  final splashDelay = 4;
  var isVisible = false;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  Future<Timer> _loadWidget() async {
    final _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User user) {
      if (user == null) {
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginSignin()));
        setState((){
          isVisible = true;
          isLoading = false;
        });
      }
      else {
        print(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            Container(
                alignment: const Alignment(0, -0.5),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                height: MediaQuery
                    .of(context)
                    .size
                    .height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/landing.jpg'),
                      fit: BoxFit.cover,
                    )
                )
            ),

            Positioned(
                width: MediaQuery.of(context).size.width,
                top: MediaQuery.of(context).size.width * 0.30,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/logo.png',
                          height: 100,
                          width: 100,),
                        const SizedBox(height: 20,),
                        Visibility(
                          visible: isLoading,
                          child:
                          const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(darkColors.breakedGreen),
                          ),
                        ),
                      ]
                  ),
                )
            ),
            Visibility(
                visible: isVisible,
                child:
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 235,
                      height: 45,
                      child:
                      RaisedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => CreateAccountScreen()));
                      },
                        color: darkColors.breakedGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)
                        ),
                        child: const Text('Inscription',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                    const Padding(padding:  EdgeInsets.only(top: 20)),
                    SizedBox(
                      width: 235,
                      height: 45,
                      child:
                      RaisedButton(onPressed: () {
                        //
                      },
                        color: const Color.fromRGBO(0,0,0,0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                            side: const BorderSide(color: Colors.white)
                        ),
                        child: const Text('Connexion',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            )
                        ),
                      ),
                    ),
                    const Padding(padding:  EdgeInsets.only(top: 10)),
                  ],
                ),
              )
            ),
          ],
        )
    );
  }
}
