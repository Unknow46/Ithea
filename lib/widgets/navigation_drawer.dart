import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/create_drawer_body.dart';
import 'package:ithea/widgets/text_style.dart';
import 'create_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}):super(key:key);

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
                  //TODO Navigation to home page
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.shop,
                text: 'Boutiques',
                onTap: () {
                  //TODO Navigation to shopping page
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.shopping_basket,
                text: 'Panier',
                onTap: () {
                  //TODO Navigation to basket page
                }
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: createDrawerBodyItem(
                icon: Icons.favorite,
                text: 'Favoris',
                onTap: () {
                  //TODO Navigation to favorite page
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
         )
        ],
      ),
    );
  }
}
