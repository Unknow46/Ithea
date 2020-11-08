import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ithea/screens/authentication/login_signin.dart';
import 'package:ithea/screens/home/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LandingScreen extends StatefulWidget {

  LandingScreen({Key key}) : super(key: key);
  final Color backgroundColor = Colors.white;
  final TextStyle styleTextUnderTheLoader = const TextStyle(
      fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}


class _LandingScreenState extends State<LandingScreen> {
  //final String _versionName = 'V1.0';
  final splashDelay = 5;

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
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const LoginSignin()));
      }
      else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => const HomeScreen()));
      }
    });
    // ignore: inference_failure_on_instance_creation
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
                      ]
                  ),
                ))
          ],
        )
    );
  }
}
