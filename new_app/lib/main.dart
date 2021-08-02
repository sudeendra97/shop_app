import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScrore = 0;

  void resetquiz() {
    setState(() {
      _questionIndex = 0;
      _totalScrore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScrore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Black', 'score': 10},
          {'text': 'Red', 'score': 8},
          {'text': 'Green', 'score': 5},
          {'text': 'White', 'score': 2},
        ],
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Rabbit', 'score': 10},
          {'text': 'Snake', 'score': 8},
          {'text': 'Elephant', 'score': 5},
          {'text': 'Lion', 'score': 1},
        ],
      },
      {
        'questionText': 'Who\'s your favorite instructor?',
        'answers': [
          {'text': 'max', 'score': 10},
          {'text': 'max', 'score': 10},
          {'text': 'max', 'score': 10},
          {'text': 'max', 'score': 10},
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : result(_totalScrore, resetquiz),
      ),
    );
  }
}
