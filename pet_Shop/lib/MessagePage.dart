import 'package:flutter/material.dart';

class messagePage extends StatelessWidget {
  const messagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Messages'),
        ),
      ),
    );
  }
}
