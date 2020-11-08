import 'package:flutter/material.dart';
import 'package:ithea/screens/authentication/landing_screen.dart';

void main() => runApp(const MyApp());

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: LandingScreen(),
    );
  }
}