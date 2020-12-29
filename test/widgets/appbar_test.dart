import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ithea/widgets/app_bar_ithea.dart';

void main(){
  testWidgets('Validate appbar widget', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        appBar: AppBarIthea('Test'),
      ),
    ));
    expect(find.text('Test'), findsOneWidget);
  });
}