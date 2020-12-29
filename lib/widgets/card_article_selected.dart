import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ithea/widgets/text_style.dart';

class CardArticle extends StatelessWidget {

  const CardArticle(this.nom, this.price, this.weight, this.quentity, this.img, {Key key, this.icon})
      :super(key:key);

  final String nom;
  final String img;
  final String weight;
  final String price;
  final String quentity;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Card(
          elevation: 0,
          child:  Padding(
            padding: const EdgeInsets.only(right: 20, bottom: 15),
            child: Row(
              children: <Widget>[
                Image.asset(img),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child:  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CustomTextStyle(nom, FontWeight.bold, 13),
                      Padding(
                        padding: const EdgeInsets.only(right: 47),
                        child: CustomTextStyle(price, FontWeight.bold, 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 53, top: 2),
                        child: CustomTextStyle('${weight}g', FontWeight.normal, 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25, top: 2),
                        child: CustomTextStyle('Quantité $quentity', FontWeight.normal, 10),
                      ),
                    ],
                  ),
                ),
                getIcon()
              ],
            ),
          ),
        ),
      );
  }

  Widget getIcon() {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Image.asset(icon),
      );
    }
    return Container();
  }
}
