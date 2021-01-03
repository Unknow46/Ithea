import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/navigation_drawer.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user =  FirebaseAuth.instance.currentUser;
    final userName = user.displayName;
    return
      Scaffold(
        appBar:  const AppBarIthea('IThea'),
        drawer: const NavigationDrawer(),
        body: SingleChildScrollView(
          child: Container (
            width: double.infinity,
            child: Column (
              children: [
                Padding (
                  padding: const EdgeInsets.only(right: 260, top: 10),
                  child :  Text('Welcome, \n $userName' ,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(height: 30,),
                SizedBox(
                  width: 340,
                  height: 214,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: darkColors.breakedPurple,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Center (
                          child : Text('Privilege Sale' ,
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}