import 'package:flutter/material.dart';
import 'package:ithea/ressources/dark_colors.dart';

import 'login.dart';

void main() => runApp(const LoginSignin());

class LoginSignin extends StatelessWidget {
  const LoginSignin({Key key}) : super(key: key);
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
                )
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 200,
                    height: 40,
                    child:
                    RaisedButton(onPressed: () {
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => const Signin()),
                    },
                      color: darkColors.breakedGreen,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)
                      ),
                      child: const Text('Inscription',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )
                      ),
                    ),
                  ),
                  const Padding(padding:  EdgeInsets.only(top: 20)),

                  SizedBox(
                    width: 200,
                    height: 40,
                    child:
                    RaisedButton(onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                      color: const Color.fromRGBO(0,0,0,0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                          side: const BorderSide(color: Colors.white)
                      ),
                      child: const Text('Connexion',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
    );
  }
}