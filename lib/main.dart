import 'package:flutter/material.dart';
import 'package:ithea/pages/counter_page.dart';
import 'package:dynamic_theme/dynamic_theme.dart';

void main() {
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
            home: CounterPage()
          );
        }
    );
  }
}
