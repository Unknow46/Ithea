import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';
import 'package:ithea/widgets/card_article_selected.dart';
import 'package:ithea/widgets/navigation_drawer.dart';

void main(){
  testWidgets('Validate favorite screen', (WidgetTester tester) async {
    const testKey = Key('K');
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
          appBar:  const AppBarIthea('Favoris'),
          drawer:  const NavigationDrawer(),
          backgroundColor: Colors.white,
          body: Stack(
            children: <Widget>[
              Column(
                children: const <Widget>[
                  CardArticle('AquaSummer', '4.00€',  '100', '1', 'assets/images/AquaSummer.png', icon: 'assets/images/panier_cercle.png', key: testKey,),
                  Divider(),
                ],
              ),
            ]
        ),
      ),
    ));
    expect(find.text('Favoris'), findsOneWidget);
    expect(find.byKey(testKey), findsOneWidget);
  });
}