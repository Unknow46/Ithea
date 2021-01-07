import 'package:flutter/material.dart';

class Mylist extends StatelessWidget {
  List <String> itemList;

  Mylist(itemList){
    this.itemList= itemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(var item in itemList)
          MyListView(
            img_location: 'assets/images/TeaBox/'+ item +'.png' ,
            img_caption: item
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget{

  final String img_location;
  final String img_caption;

  MyListView({this.img_location, this.img_caption});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: InkWell(
        onTap: (){},
        child: ListTile(
          title: Image.asset(img_location),
          subtitle: Container(
            alignment: Alignment.topCenter,
            child: Text(img_caption,style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 12,
            ))),
        ),
      ),
    );
  }
}
