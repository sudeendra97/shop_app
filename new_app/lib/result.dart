import 'package:flutter/material.dart';

class result extends StatelessWidget {
  final int resultscore;
  final Function() functionhandler;

  result(this.resultscore, this.functionhandler);

  String get returnPhrase {
    var returntext = 'you did it';
    if (resultscore <= 8) {
      returntext = 'you are awesome and innocent';
    } else {
      returntext = 'you are strong';
    }
    return returntext;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            returnPhrase,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          TextButton(onPressed: functionhandler, child: Text('Reset'))
        ],
      ),
    );
  }
}
