import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:ithea/pages/authentication/landing_screen.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget  {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  DynamicTheme(
        defaultBrightness: Brightness.light,
        data: (brightness) =>  ThemeData(
          primarySwatch: Colors.green,
          brightness: brightness,
        ),
        themedWidgetBuilder: (context, theme) {
          return MaterialApp(
              title: 'Flutter Demo',
              theme: theme,
              home: const LandingScreen()
          );
        }
    );
  }
}
