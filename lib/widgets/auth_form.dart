import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthForm extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
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
            decoration: const InputDecoration(
              hintText: 'Email',
              suffixIcon: Icon(Icons.email),
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
            decoration: const InputDecoration(
              hintText: 'Password',
              suffixIcon: Icon(Icons.visibility_off),
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
              decoration: const InputDecoration(
                hintText: 'Name',
                suffixIcon: Icon(Icons.account_circle),
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