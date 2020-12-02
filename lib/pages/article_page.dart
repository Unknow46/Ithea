import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'article_details_page.dart';


class ArticlePage extends StatelessWidget {
  const ArticlePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: const IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.greenAccent,
          ),
          onPressed: null,
        ),
        title: const Text(
          'LOGO',
          style: TextStyle(
              fontFamily: 'Varela', fontSize: 20, color: Color(0xFF545D68)),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.list,
              color: Colors.grey,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 20),
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(right: 15),
            width: MediaQuery.of(context).size.width - 30,
            height: MediaQuery.of(context).size.height - 50,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Tea1', '14,00 €', 'assets/images/teaPic.png',
                    true, context, false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String name, String price, String imgpath, bool isFavourite,
      dynamic buildContext, bool added) {
    return Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
        child: InkWell(
            onTap: () {
              Navigator.of(buildContext).push(
                  MaterialPageRoute <dynamic>(builder: (context) => ArticleDetail(
                    assetPath: imgpath,
                    teaprice: price,
                    teaname: name,
                  )));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 5,
                  )
                ],
                color: Colors.white,
              ),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isFavourite)
                        const Icon(Icons.favorite_outlined, color: Colors.red)
                      else
                        const Icon
                          (Icons.favorite_outline, color: Colors.red)
                    ],
                  ),
                ),
                Hero(
                  tag: imgpath,
                  child: Container(
                    height: 75,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(
                        imgpath,
                      ),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.greenAccent,
                    fontFamily: 'Varela',
                    fontSize: 14,
                  ),
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black45,
                    fontFamily: 'Varela',
                    fontSize: 14,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(8),
                    child:
                        Container(color: const Color(0xFFEBEBEB), height: 1)),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (!added) ...[
                        const Icon(Icons.shopping_basket,
                            color: Colors.greenAccent, size: 12),
                        const Text('Add to cart',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Colors.greenAccent,
                                fontSize: 12))
                      ],
                      if (added) ...[
                        const Icon(Icons.remove_circle_outline,
                            color: Colors.greenAccent, size: 12),
                        const Text('3',
                            style: TextStyle(
                                fontFamily: 'Varela',
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                        const Icon(Icons.add_circle_outline,
                            color: Colors.greenAccent, size: 12),
                      ]
                    ],
                  ),
                ),
              ]),
            )));
  }
}
