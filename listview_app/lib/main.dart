import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('flutter image demo'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset('assets/person.jpg'),
            Image.asset('assets/person1.jpg'),
            Image.asset('assets/yoda.jpg'),
            Image.asset('assets/toy.jpg')
          ],
        ),
      ),
    );
  }
}
