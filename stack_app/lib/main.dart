import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: GridView.count(
            children: [
              Stack(
                children: [imagebox(), textbox()],
              )
            ],
            crossAxisCount: 1,
          ),
        ),
      ),
    );
  }

  Widget imagebox() {
    return Image.asset('assets/road.jpg');
  }

  Widget textbox() {
    return Container(
      width: 100,
      height: 40,
      color: Colors.blue[100],
      alignment: Alignment.topLeft,
      child: Text(
        'Endless Road',
      ),
    );
  }
}
