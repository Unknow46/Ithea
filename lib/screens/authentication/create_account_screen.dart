import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ithea/screens/home/home_screen.dart';
import 'package:ithea/widgets/auth_form.dart';
import 'package:ithea/widgets/auth_form.dart';
import 'package:ithea/widgets/custom_dialog.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../globals.dart' as globals;

void main() => runApp(CreateAccountScreen());

class CreateAccountScreen extends StatelessWidget {
  var authForm = AuthForm(isVisible: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Center(
            child: Image.asset(
                'assets/images/greenLogo.png', fit: BoxFit.cover),
          ),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 60,),
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
                      authForm,
                      const SizedBox(height: 30,),
                      Center(
                        child: SizedBox(
                          height: 45,
                          width: 200,
                          child: RaisedButton(onPressed: () {
                            emailRegister(context);
                          },
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
                        onPressed: () {print(globals.isLoggedIn);},
                      ),
                      const Divider(),
                      SignInButton(
                        Buttons.Google,
                        text: 'Continue with Google',
                        onPressed: () {
                          signInWithGoogle(context);
                        },
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

  void emailRegister(BuildContext context) async {
    final emailValid = mailValidator(authForm.getEmailText());
    if (!emailValid) {
      showAlert(context, 'please insert a valid email address');
      return;
    }
    if (authForm.getPasswordText().isEmpty) {
      showAlert(context, 'please insert a password');
      return;
    }
    if (authForm.getPseudoText().isEmpty) {
      showAlert(context, 'please insert a pseudo');
      return;
    }
    try {
      final authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authForm.getEmailText(),
        password: authForm.getPasswordText(),
      );

      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()
          )
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlert(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showAlert(context, 'Account already exists for that email');
      }
    } catch (e) {
      print(e);
    }
  }

  void showAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) =>
          CustomDialog(
            icon: Icons.warning, message: message, title: 'Warning',),
    );
  }

  bool mailValidator(String email) {
    final emailValid =
    RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  void signInWithGoogle(BuildContext context) async {
    final googleSignIn = GoogleSignIn();

    await Firebase.initializeApp();

    final googleSignInAccount = await googleSignIn.signIn();
    final googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final authResult = await FirebaseAuth.instance.signInWithCredential(
        credential);
    final user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final currentUser = FirebaseAuth.instance.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => const HomeScreen()
          )
      );
    } else {
      showAlert(context, 'Google Authentication Error');
    }
  }
}