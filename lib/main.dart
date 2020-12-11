import 'package:flutter/material.dart';
import 'package:ithea/pages/counter_page.dart';
import 'package:ithea/ressources/utils/styles.dart';
import 'package:ithea/widgets/dark_theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  Future<void> getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
    await themeChangeProvider.darkThemePreference.getTheme();
  }


  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (_) {
      return themeChangeProvider;
    },
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget child) {
            return MaterialApp(
            title: 'Flutter Demo',
            theme:  Styles.themeData(themeChangeProvider.darkTheme, context),
            home: CounterPage(),
            );
      },
    ),
  );
  }
}