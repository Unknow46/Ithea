import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ithea/pages/article_details_page.dart';

class Mylist extends StatefulWidget {
  const Mylist({Key key}) : super(key: key);
  @override
  _MylistState createState() => _MylistState();
}
// ignore: must_be_immutable
class _MylistState extends State<Mylist> {
   var itemList = [];
   CollectionReference articles = FirebaseFirestore.instance.collection('articles');
   List<dynamic> articlesList = [];
   @override
   void initState() {
     getArticles();
     super.initState();
   }
  // ignore: inference_failure_on_untyped_parameter, sort_constructors_first, use_key_in_widget_constructors
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: articlesList.map(
                (article) => MyListView(name: article['name'].toString(),image: article['image'], price: article['price'].toString())).toList(),
      ),
    );
  }
   // ignore: inference_failure_on_function_return_type, always_declare_return_types
   getArticles() async {
     final snapshot = await articles.get();
     setState(() {
       articlesList = snapshot.docs;
     });
   }
}

class MyListView extends StatelessWidget{
  final String image;
  final String name;
  final String price;

  // ignore: sort_constructors_first, use_key_in_widget_constructors
  const MyListView({this.image, this.name, this.price});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute<dynamic>(
              builder: (context) => ArticleDetail(
                assetPath: image,
                teaprice: price,
                teaname: name,
              )));
        },
        child: ListTile(
          title: Container(
            height: 70,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: MemoryImage(base64.decode(image)),
              )),
          ),
          subtitle: Container(
              alignment: Alignment.topCenter,
            child: Text(name,style: const TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 14,
            ))),
        ),
      ),
    );
  }
}
