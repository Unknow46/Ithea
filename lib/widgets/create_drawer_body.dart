import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/text_style.dart';

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child:
          CustomTextStyle(text, FontWeight.bold, 24),
        )
      ],
    ),
    onTap: onTap,
  );
}