import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(children: <Widget>[
        Padding(
            padding: const EdgeInsets.only(top:5),
          child: Align(
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
      ]));
}