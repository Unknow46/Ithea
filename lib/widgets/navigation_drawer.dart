import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/pages/article_page.dart';
import 'package:ithea/pages/basket_page.dart';
import 'package:ithea/pages/favorite_page.dart';
import 'package:ithea/pages/home/home_screen.dart';
import 'package:ithea/widgets/create_drawer_body.dart';
import 'package:ithea/widgets/text_style.dart';
import 'create_drawer_header.dart';

class NavigationDrawer extends StatelessWidget  {
  const NavigationDrawer({Key key}):super(key:key);

  void themeSwitch(BuildContext context) {
    DynamicTheme.of(context).setBrightness(
        Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark);
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          createDrawerHeader(),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.home,
                text: 'Home',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<dynamic>(
                      builder: (context) => const HomeScreen()),
                );
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.shop,
                text: 'Boutiques',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const ArticlePage()),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.shopping_basket,
                text: 'Panier',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const Basket()),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.favorite,
                text: 'Favoris',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                        builder: (context) => const Favorite()),
                  );
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.account_box,
                text: 'Compte',
                onTap: () {
                  //TODO Navigation to account page
                }
            ),
          ),
          const Padding(padding: EdgeInsets.only(top:20)),
          const Divider(),
         PreferredSize(
             preferredSize: const Size.fromWidth(140),
             child:  Row(
               mainAxisSize: MainAxisSize.min,
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Flexible(child:
                 Column(
                   children: const <Widget>[
                     Padding(padding: EdgeInsets.only(top: 20),
                         child:  Align(
                           alignment: Alignment.bottomCenter,
                           child: Icon(Icons.help_outline),
                         )
                     ),
                     Align(
                       alignment: Alignment.bottomCenter,
                       child: CustomTextStyle('Aide et feedback',
                           FontWeight.normal, 18),
                     ),
                   ],
                 ),
                 ),
                 Flexible(child:
                 Column(
                   children: const <Widget>[
                     Padding(padding: EdgeInsets.only(left: 10, top: 20),
                         child:  Align(
                           alignment: Alignment.bottomCenter,
                           child: Icon(Icons.share),
                         )
                     ),
                     Padding(padding: EdgeInsets.only(left: 10),
                       child:  Align(
                         alignment: Alignment.bottomCenter,
                         child: CustomTextStyle('Partage', FontWeight.normal, 18),
                       ),
                     ),
                   ],
                 ),
                 ),
               ],
             )),
         const Padding(padding: EdgeInsets.only(top: 40),
         child:  Align(
           child: CustomTextStyle('v 1.0.0', FontWeight.normal, 14),
          ),
         ),

           Padding(padding: const EdgeInsets.only(top: 40),
            child:  Align(
              child: FlatButton(onPressed: () {
                themeSwitch(context);
              },
                color: Colors.green,
                child: _darkMode(context),
              )
              )
            ),
        ],
      ),
    );
  }

  Widget _darkMode(BuildContext context){
    if (Theme.of(context).brightness == Brightness.dark) {
      return const CustomTextStyle('Thème clair', FontWeight.bold, 18);
    } else {
      return const CustomTextStyle('Thème sombre', FontWeight.bold, 18);
    }
  }
}
