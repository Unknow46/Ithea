import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ithea/data/dataSources/firestoreDataSources/firestore.dart';
import 'package:ithea/data/entities/client.dart';
import 'package:ithea/pages/counter_page.dart';
import 'package:ithea/pages/home/home_screen.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:ithea/pages/authentication/login.dart';
import 'package:ithea/widgets/auth_form.dart';
import 'package:ithea/widgets/custom_dialog.dart';

void main() => runApp(CreateAccountScreen());

// ignore: use_key_in_widget_constructors, must_be_immutable
class CreateAccountScreen extends StatelessWidget {
  var authForm = AuthForm(isVisible: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
        appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            title: Image.asset('assets/images/Logo_Small.png'),
            leading: IconButton(
              onPressed:(){Navigator.pop(context);},
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            )
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 35,),
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
                        shape:
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        onPressed: () {},
                      ),
                      SignInButton(
                        Buttons.Google,
                        text: 'Continue with Google',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          signInWithGoogle(context);
                        },
                      ),
                      SignInButton(
                        Buttons.AppleDark,
                        text: 'Continue with Apple',
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {},
                      ),
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
                            onTap: () {Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));},
                            child: const Text('Connexion',
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
        )
    );
  }

  Future<void> emailRegister(BuildContext context) async {
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
      final client = Client(
          authForm.getPseudoText(),
          authResult.user.email,
          authResult.user.emailVerified,
          authResult.user.photoURL,
          authResult.user.uid,
      );
      await Firestore.instance.insertUserDocument(client, authResult.user.uid);
      await Navigator.pushReplacement(
          context,
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
              builder: (BuildContext context) => CounterPage()
          )
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlert(context, 'The password provided is too weak');
      } else if (e.code == 'email-already-in-use') {
        showAlert(context, 'Account already exists for that email');
      }
    } catch (e) {
      // ignore: avoid_print
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

  Future<void> signInWithGoogle(BuildContext context) async {
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

      final client = Client(
        authResult.user.displayName,
        authResult.user.email,
        authResult.user.emailVerified,
        authResult.user.photoURL,
        authResult.user.uid,
      );
      await Firestore.instance.insertUserDocument(client, authResult.user.uid);

      // ignore: avoid_print
      print('signInWithGoogle succeeded: $user');

      await Navigator.pushReplacement(
          context,
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
              builder: (BuildContext context) => HomeScreen()
          )
      );
    } else {
      showAlert(context, 'Google Authentication Error');
    }
  }
}