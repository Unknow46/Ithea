import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ithea/widgets/navigation_drawer.dart';

void main() {
  testWidgets('Validate drawer widget', (WidgetTester tester) async {
    //setting a key to open the drawer
    final scaffoldKey = GlobalKey<ScaffoldState>();
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          key: scaffoldKey,
          drawer: const NavigationDrawer(),
        ),
      ),
    );
    expect(find.text('Home'), findsNothing);
    scaffoldKey.currentState.openDrawer();
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));
    expect(find.text('Compte'), findsOneWidget);
    expect(find.byIcon(Icons.home),findsOneWidget);
  });
}