
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/card_article_selected.dart';
import 'package:ithea/widgets/dark_theme_provider.dart';
import 'package:ithea/widgets/navigation_drawer.dart';
import 'package:ithea/widgets/text_style.dart';
import 'package:provider/provider.dart';

class Basket extends StatefulWidget {

  const Basket({Key key}):super(key: key);

  @override
  _BasketState createState() => _BasketState();
}

class _BasketState extends State<Basket> {

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return  Scaffold(
          appBar:  const AppBarIthea('Panier'),
          drawer:  const NavigationDrawer(),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
                  Column(
                    children:  <Widget>[
                       const CardArticle('AquaSummer', '4.00€',  '100', '1', 'assets/images/AquaSummer.png'),
                       const Divider(),
                      Padding(padding: const EdgeInsets.only(top: 40),
                        child:  Align(
                            child: Checkbox(value: themeChange.darkTheme,
                                onChanged: (bool value) {
                                  setState(() {
                                    themeChange.darkTheme = value;
                                  });
                                })
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Divider(),
                      const Padding(padding: EdgeInsets.only(top: 10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                           const FlatButton(
                             minWidth: 169,
                            height: 45,
                            disabledColor: Colors.green,
                            onPressed: null,
                            child: CustomTextStyle('Valider le panier', FontWeight.normal, 18, colors: Colors.white,)
                          ),
                          Column(
                            children: const <Widget>[
                              CustomTextStyle('Total:', FontWeight.normal, 18),
                              Padding(padding: EdgeInsets.only(top: 5)),
                              CustomTextStyle('28,00€', FontWeight.normal, 16),
                            ],
                          )
                        ],
                      ),
                    const Padding(padding: EdgeInsets.only(bottom: 40))
                    ],
                  )
            ],
          )
    );
  }
}
