import 'package:flutter/material.dart';
import 'package:ithea/ressources/dark_colors.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({@required this.icon, @required this.message, @required this.title});

  IconData icon;
  String message;
  String title;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4)
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 250,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                child: Column(
                  children: [
                    Text(title , style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    const SizedBox(height: 20,),
                    Text(
                      message,
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20,),
                    RaisedButton(onPressed: () {
                      Navigator.of(context).pop();
                    },
                      color: darkColors.breakedGreen,
                      child: const Text('Okay', style: TextStyle(color: Colors.white),),
                    )
                  ],
                ),
              ),
            ),
             Positioned(
                top: -60,
                child: CircleAvatar(
                  backgroundColor: darkColors.breakedGreen,
                  radius: 55,
                  child: Icon(icon, color: Colors.white, size: 50,),
                )
            ),
          ],
        )
    );
  }
}