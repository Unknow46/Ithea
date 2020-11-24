import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ithea/store/counter/counter.dart';

class CounterPage extends StatelessWidget {
  CounterPage({Key key}) : super(key: key);

  final Counter counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobx'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'Counter',
                style: TextStyle(fontSize: 30),
            ),
            Observer(
                builder: (_) => Text(
                  '${counter.count}',
                ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                FlatButton.icon(
                    onPressed: counter.increment,
                    icon: const Icon(Icons.add),
                    label: const Text('Add')),
                FlatButton.icon(
                    onPressed: counter.decrement,
                    icon: const Icon(Icons.remove),
                    label: const Text('Minus')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
