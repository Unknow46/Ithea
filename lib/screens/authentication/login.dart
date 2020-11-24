import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:ithea/screens/authentication/create_account_screen.dart';
import 'package:ithea/screens/authentication/signin.dart';
import 'package:ithea/widgets/auth_form.dart';

void main() => runApp(Login());

class Login extends StatelessWidget {
  var authForm = AuthForm(isVisible: false);
  // const Login({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        //title: const Text('Retour', style: TextStyle(fontSize: 15,color: Colors.black),),
        title: Image.asset('assets/images/Logo_Small.png'),
        leading: IconButton(
            onPressed:(){Navigator.pop(context);},
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        )
      ),
      // ignore: avoid_unnecessary_containers
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration:const BoxDecoration(
              image: DecorationImage(
                  alignment: Alignment.topRight,
                  image: AssetImage('assets/images/vector.png'),
                  )
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: Text('Connexion',
                  style: GoogleFonts.roboto(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),

              ),
              const SizedBox(height: 30,),
              Center(
                child:
                Container(
                  width: 300,
                  child: Column(
                    children: [
                      authForm,
                      const SizedBox(height: 30,),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child:RaisedButton(onPressed: () {},
                          color: darkColors.breakedGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Connexion',
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
                         InkWell(
                           onTap: () {},
                           child: const Text('Mot de passe oublier?'),
                         )
                        ],
                      ),
                      const SizedBox(height: 30,),
                      SignInButton(
                          Buttons.FacebookNew,
                          text: 'Continuer avec Facebook',
                          shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                  ),
                          onPressed: () {}),
                      const SizedBox(height: 5,),
                      SignInButton(
                        Buttons.Google,
                        text: 'Continuer avec Google',
                        shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                ),
                        onPressed: () {},
                      ),

                      const SizedBox(height: 5,),

                      SignInButton(
                          Buttons.AppleDark,
                        text: 'Continuer avec Apple',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {},
                      ),

                      const SizedBox(height: 20,),
                      
                      Text('I-TEA', style: GoogleFonts.vidaloka(
                        fontSize: 100,
                        color: const Color.fromRGBO(182, 209, 183, 0.2)
                        ),
                      ),

                      const SizedBox(height: 5,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Pas encore parmis nous ? '),
                          InkWell(
                            // ignore: inference_failure_on_instance_creation
                            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => CreateAccountScreen()));},
                            child: const Text('Inscription',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: darkColors.breakedBlue
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}