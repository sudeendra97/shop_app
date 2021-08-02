import 'package:flutter/material.dart';

class answer extends StatelessWidget {
  final VoidCallback select;
  answer(this.select);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        color: Colors.blue,
        child: Text('answer 1'),
        onPressed: select,
      ),
    );
  }
}
