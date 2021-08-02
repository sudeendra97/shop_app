import 'package:flutter/material.dart';

class birds extends StatelessWidget {
  const birds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Birds'),
        ),
      ),
    );
  }
}
