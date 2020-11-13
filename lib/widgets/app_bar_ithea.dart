

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/text_style.dart';

class AppBarIthea extends StatelessWidget implements PreferredSizeWidget {
  const AppBarIthea(this.title, {Key key}):super(key:key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
        child: Stack(
          children: <Widget>[
            Align(
              child: Image.asset('assets/images/Logo.png'),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom:70),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: GestureDetector(
                          onTap: () {
                             Navigator.pop(context);
                          },
                          child: const Icon(Icons.chevron_left)
                      )
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 74),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: CustomTextStyle('Retour', FontWeight.bold, 13)
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: CustomTextStyle(title, FontWeight.bold, 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10 ,bottom: 30, right: 15),
                  child:  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        //TODO Navigation to shopping page
                      },
                      child: Image.asset('assets/images/panier.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10 ,bottom: 30, right: 15),
                  child:  Align(
                    alignment: Alignment.bottomRight,
                    child: GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                      child: Image.asset('assets/images/Hamburger.png'),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Divider(),
              ),
            ),
          ],
        ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(120);
}