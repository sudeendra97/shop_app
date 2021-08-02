import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int count = 1;
  var questions = [
    'what is your favorite color',
    'what is your favorite animal',
    'what is your favorite drink'
  ];

  void run() {
    setState(() {
      count = count + 1;
    });
    print('question is answered');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
          ),
          body: Column(
            children: [
              question(questions[count]),
              answer(run),
              answer(run),
              answer(run),
            ],
          )),
    );
  }
}
