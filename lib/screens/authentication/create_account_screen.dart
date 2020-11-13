import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ithea/screens/home/home_screen.dart';
import 'package:ithea/widgets/custom_dialog.dart';

void main() => runApp(CreateAccountScreen());

class CreateAccountScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pseudoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Center(
              child : Image.asset('assets/images/greenLogo.png', fit: BoxFit.cover),
            ),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 15,),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,),
                child: Text(
                 'Create Account',
                 style: TextStyle(
                     fontSize: 22,
                     fontWeight: FontWeight.bold),),
                ),
              Center(
                child:
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/vector.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 300,
                  child: Column(
                    children: [
                      const SizedBox(height: 30,),
                      Container(
                        height: 50,
                        width: 450,
                        child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            suffixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 450,
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: const Icon(Icons.visibility_off),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(
                        height: 50,
                        width: 450,
                        child: TextField(
                          controller: pseudoController,
                          decoration: InputDecoration(
                            hintText: 'Pseudo',
                            suffixIcon: const Icon(Icons.account_circle),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30,),
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: RaisedButton(onPressed: () {_register(context);},
                          color: darkColors.breakedGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text('Create Account',
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      /* Divider(
                      height:20,
                      thickness: 0.5,
                      color: Colors.black,
                    ),*/
                      const SizedBox(height: 10,),
                      SignInButton(
                        Buttons.FacebookNew,
                        text: 'Continue with Facebook',
                        onPressed: () {},
                      ),
                      const Divider(),
                      SignInButton(
                        Buttons.Google,
                        text: 'Continue with Google',
                        onPressed: () {},
                      ),
                      const Divider(),
                      SignInButton(
                        Buttons.AppleDark,
                        text: 'Continue with Apple',
                        onPressed: () {},
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

  void _register(BuildContext context) async {
    final emailValid = _mailValidator (emailController.text);
    if (!emailValid) {
      _showAlert(context , 'please insert a valid email address');
      return;
    }
    if (passwordController.text.isEmpty){
      _showAlert(context , 'please insert a password');
      return;
    }
    if (pseudoController.text.isEmpty){
      _showAlert(context , 'please insert a pseudo');
      return;
    }
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()
          )
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _showAlert(context , 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        _showAlert(context , 'Account already exists for that email');
      }
    } catch (e) {
      print(e);
    }
  }

  void _showAlert(BuildContext context, String message) {
    showDialog(
        context: context,
        builder: (context) => CustomDialog(icon: Icons.warning, message: message , title: 'Warning',),
    );
  }

  bool _mailValidator(String email) {
    final emailValid =
    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    return emailValid;
  }
}
