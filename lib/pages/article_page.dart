import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ArticlePage extends StatelessWidget {
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
          onPressed: (null),
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
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[
          const Text(
            'Boutique',
            style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
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
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png',
                    false, context),
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png', true,
                    context),
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png', true,
                    context),
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png',
                    false, context),
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png',
                    false, context),
                _buildCard('Tea1', '3.99 USD', 'assets/images/teaPic.png',
                    false, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String price, String imgpath, bool isFavourite, context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5, left: 5, right: 5),
      child: InkWell(
        onTap: () {},
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (isFavourite) const Icon(Icons.favorite_outlined, color: Colors.red) else const Icon(Icons.favorite_outline, color: Colors.red)
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
            ],
          ),
        ),
      ),
    );
  }
}
