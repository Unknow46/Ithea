import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Mylist extends StatelessWidget {
  List <String> itemList;

  // ignore: inference_failure_on_untyped_parameter, sort_constructors_first, use_key_in_widget_constructors
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
            img_location: 'assets/images/TeaBox/$item.png' ,
            img_caption: item
          ),
        ],
      ),
    );
  }
}

class MyListView extends StatelessWidget{

  // ignore: non_constant_identifier_names
  final String img_location;
  // ignore: non_constant_identifier_names
  final String img_caption;

  // ignore: non_constant_identifier_names, sort_constructors_first, use_key_in_widget_constructors
  const MyListView({this.img_location, this.img_caption});
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
            child: Text(img_caption,style: const TextStyle(
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
