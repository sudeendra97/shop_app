import 'package:flutter/material.dart';

class NextPage extends StatelessWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('next paga'),
        ),
        body: Container(
          height: 400,
          width: 400,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.asset('assets/image.jpg'),
          ),
        ),
      ),
    );
  }
}
