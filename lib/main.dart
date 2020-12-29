import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ithea/pages/authentication/landing_screen.dart';

// ignore: avoid_void_async
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: LandingScreen(),
    );
  }
}