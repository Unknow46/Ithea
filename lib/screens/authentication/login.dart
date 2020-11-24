import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() => runApp(const Login());

class Login extends StatelessWidget {
  const Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        //title: const Text('Retour', style: TextStyle(fontSize: 15,color: Colors.black),),
        leading: IconButton(
            onPressed:(){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        )
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Login',
                style: GoogleFonts.roboto(
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            const SizedBox(height: 5,),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Text('Log in to your account',
                style: GoogleFonts.roboto(
                    fontSize: 15),
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child:
              Container(
                color: Colors.white,
                width: 300,
                child: Column(
                  children: [
                    const TextField(
                      decoration: InputDecoration(
                          labelText: 'Email'
                      ),
                    ),

                    const SizedBox(height: 10,),

                    const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: 'PassWord'
                      ),
                    ),

                    const SizedBox(height: 20,),

                    SizedBox(
                      height: 40,
                      width: 200,
                      child:RaisedButton(onPressed: () {},
                        color: darkColors.breakedGreen,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text('Login',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              ),
                          ),
                      ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text('Forgot your password?')
                      ],
                    ),
                    const SizedBox(height: 30,),
                   /* Divider(
                      height:20,
                      thickness: 0.5,
                      color: Colors.black,
                    ),*/
                    const SizedBox(height: 10,),
                    SignInButton(
                      Buttons.FacebookNew,
                      onPressed: () {
                      },
                    ),
                    const Divider(),
                    SignInButton(
                      Buttons.Google,
                      onPressed: () {
                      },
                    ),
                    const Divider(),
                    SignInButton(
                      Buttons.AppleDark,
                      onPressed: () {
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}