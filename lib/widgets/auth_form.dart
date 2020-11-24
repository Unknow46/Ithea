import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';

class AuthForm extends StatelessWidget {
  AuthForm({@required this.isVisible});
  bool isVisible;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final pseudoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column (
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
                borderRadius: BorderRadius.circular(10),
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
        Visibility(
          visible: isVisible,
          child: Container(
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
        ),
      ],
    );
  }

  String getEmailText() {
    return emailController.text;
  }
  String getPasswordText() {
    return passwordController.text;
  }
  String getPseudoText() {
    return pseudoController.text;
  }
}