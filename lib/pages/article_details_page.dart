import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleDetail extends StatelessWidget {
  final assetPath, teaprice, teaname;

  const ArticleDetail({Key key, this.assetPath, this.teaprice, this.teaname})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF545D68)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Pickup',
            style: TextStyle(
                fontFamily: 'Varela',
                fontSize: 20.0,
                color: Color(0xFF545D68))),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF545D68)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        const SizedBox(height: 45),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Center(
            child: Text(
              teaname,
              style: GoogleFonts.getFont('Vidaloka',
                  fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(height: 85),
        Hero(
            tag: assetPath,
            child: Image.asset(assetPath,
                height: 150, width: 100, fit: BoxFit.contain)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 35),
          child: Row(
            children: <Widget>[
              Center(
                child: Text(teaprice,
                    style: GoogleFonts.getFont('Vidaloka',
                        fontSize: 25, fontWeight: FontWeight.bold)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 170),
                child: Icon(Icons.share),
              ),
              const Icon(CupertinoIcons.heart),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
              'Description',
              style: GoogleFonts.getFont('Vidaloka',
                  fontSize: 25  ,
                  fontWeight: FontWeight.bold,),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget sodales diam velit dapibus viverra.',
                style: GoogleFonts.getFont('Vidaloka',color: Color(0xFFB4B8B9))),
          ),
        ),
        const SizedBox(height: 30),
        Center(
          child: InkWell(
            onTap: () {
              print('Hello There');
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50,
              decoration: const BoxDecoration(color: Colors.green),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Icon(
                  Icons.shopping_basket_outlined,
                  color: Colors.white,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 15),
                ),
                Text(
                  'Add to cart',
                  style: GoogleFonts.getFont('Vidaloka',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ]),
            ),
          ),
        ),
      ]),
    );
  }
}
