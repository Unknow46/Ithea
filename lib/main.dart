import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ithea/pages/article_page.dart';
//mai
// ignore: avoid_void_async
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ArticlePage(),
    );
  }
}



