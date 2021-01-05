import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ithea/ressources/dark_colors.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/navigation_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var title = 'Nan';
  var type = 'Nan';
  var value = 'Nan';
  var date = 'Nan';

  @override
  Widget build(BuildContext context) {
    final user =  FirebaseAuth.instance.currentUser;
    final userName = user.displayName;
    updateCard(context);
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
                  width: 350,
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
                        Center (
                          child : Text(title ?? '',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                        Padding (
                          padding: const EdgeInsets.only(right: 240, top: 20),
                          child : Text(value ?? '' ,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 40,
                              )),
                        ),
                        Padding (
                          padding: const EdgeInsets.only(left: 10),
                          child : Text(type ?? '' ,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 27,
                              )
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(date ?? '' ,
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 15,
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                const SizedBox(
                  height: 100,
                ),
                Text('Our Best Recipes' ,
                  style: GoogleFonts.vidaloka(
                      fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //Image.asset('assets/images/recips.png'),
                Material(
                    child: InkWell(
                      onTap: () {
                        launchURL();
                      },
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: ClipRRect(
                          child: Image.asset('assets/images/recips.png'),
                        ),
                      ),
                    )
                )
              ],
            ),
          ),
        ),
      );
  }
  Future<void> updateCard(BuildContext context) async {
    final promotions = FirebaseFirestore.instance.collection('promotions').doc('UoIt7VsnnNH3cg1OjntB');
    promotions.snapshots().listen((snapshot) {
      if (snapshot.exists){
        setState(() {
          title = snapshot.data()['title'];
          type = snapshot.data()['type'];
          value = snapshot.data()['value'];
          date = snapshot.data()['promotionDate'];
        });
      }
    });
  }
  Future<void> launchURL() async {
    const url = 'https://www.palaisdesthes.com/fr/les-selections-du-palais/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // ignore: only_throw_errors
      throw 'Could not launch $url';
    }
  }
}

